/* eslint-disable linebreak-style */
/* eslint-disable no-unused-vars */
const express = require('express');
const { PrismaClient } = require('@prisma/client');

// eslint-disable-next-line no-unused-vars
const prisma = new PrismaClient();
const router = express.Router();

router.post('/', async (req, res) => {
  const {
    offlineId,
    sellerId,
    driverId,
    itineraryId,
    deviceId,
    startTime,
    sellingDate,
    vehiculeId,
    companieId,
    operatorId,
    reseauId,
  } = req.body;
  // eslint-disable-next-line no-console
  console.log('🚀 ~ router.post ~ req.body:', req.body);
  const oldservices = await prisma.selling.findMany({
    where: {
      deviceId,
      isActiveted: true,
    },
  });
  // eslint-disable-next-line no-console
  console.log('🚀 ~ router.post ~ oldservices:', oldservices);
  if (oldservices.length > 0) {
    await prisma.selling.updateMany({
      where: {
        deviceId,
      },
      data: {
        isActiveted: false,
      },
    });
  }
  const type = 'Vente';
  const result = await prisma.Selling.create({
    data: {
      type,
      offlineId,
      sellerId,
      driverId,
      itineraryId,
      deviceId,
      startTime,
      sellingDate,
      vehiculeId,
      companieId,
      operatorId,
      reseauId,
    },
    include: {
      driver: true,
      seller: true,
    },
  });
  res.json(result);
});
router.post('/end', async (req, res) => {
  const {
    id,
    revenue,
    expense,
    solde,
    totalTicket,

  } = req.body;
  const d = new Date();
  const time = d.toLocaleTimeString('fr-FR');
  // eslint-disable-next-line no-console
  this.revenue = Number(revenue);
  this.expense = Number(expense);
  this.solde = Number(solde);
  this.totalTicket = Number(totalTicket);
  const result = await prisma.selling.update({
    where: {
      id,
    },
    data: {
      isActiveted: false,
      endTime: time,
      revenue: this.revenue,
      expense: this.expense,
      solde: this.solde,
      totalTicket: this.totalTicket,
    },
  });
  res.json(result);
});
module.exports = router;
