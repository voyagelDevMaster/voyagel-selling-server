/* eslint-disable linebreak-style */
/* eslint-disable semi */
/* eslint-disable linebreak-style */
/* eslint-disable no-unused-vars */
const express = require('express');
const { PrismaClient } = require('@prisma/client');

// eslint-disable-next-line no-unused-vars
const prisma = new PrismaClient();
const router = express.Router();

router.post('/', async (req, res) => {
  const {
    number,
    trajetId,
    offlineSellingId,
    itineraryId,
    duration,
    departureTime,
    arrivalTime,
    sellingId,
    rising,
    destination,
    revenue,
    operatorId,
    companieId,
    reseauId,
    isActivated,
    isOnline,
  } = req.body;

  const result = await prisma.Trajet.create({
    data: {
      number,
      trajetId,
      offlineSellingId,
      itineraryId,
      duration,
      departureTime,
      arrivalTime,
      sellingId,
      rising,
      destination,
      revenue,
      operatorId,
      companieId,
      reseauId,
      isActivated,
      isOnline,
    },
  });

  res.json(result);
});
router.post('/add', async (req, res) => {
  const {
    oldData,
    newData,
    revenue,
  } = req.body;
  // eslint-disable-next-line no-console
  console.log('Olddata from api request', oldData);
  // eslint-disable-next-line no-console
  console.log('Newdata from api request', newData);
  this.revenue = Number(revenue)
  await prisma.Trajet.upsert({
    where: {
      id: oldData.id,
    },
    update: {
      arrivalTime: oldData.arrivalTime,
      isActivated: oldData.isActivated,
      revenue: oldData.revenue,
    },
    create: {
      trajetId: oldData.trajetId,
      offlineSellingId: oldData.offlineSellingId,
      itineraryId: oldData.itineraryId,
      number: oldData.number,
      duration: oldData.duration,
      departureTime: oldData.departureTime,
      arrivalTime: oldData.arrivalTime,
      sellingId: oldData.sellingId,
      rising: oldData.rising,
      destination: oldData.destination,
      revenue: oldData.revenue,
    },
  });
  const save = await prisma.Trajet.create({
    data: {
      trajetId: newData.trajetId,
      offlineSellingId: newData.offlineSellingId,
      itineraryId: newData.itineraryId,
      number: newData.number,
      duration: newData.duration,
      departureTime: newData.departureTime,
      arrivalTime: newData.arrivalTime,
      sellingId: newData.sellingId,
      rising: newData.rising,
      destination: newData.destination,
      revenue: newData.revenue,
    },
  });
  let result;
  if (save) {
    await prisma.selling.update({
      where: {
        offlineId: newData.offlineSellingId,
      },
      data: {
        revenue: this.revenue,
      },
    });
    result = await prisma.Trajet.findMany({
      where: {
        offlineSellingId: newData.offlineSellingId,
      },
      include: {
        Tickets: true,
        Controls: true,
      },
    });
  }

  res.json(result);
});
module.exports = router;
