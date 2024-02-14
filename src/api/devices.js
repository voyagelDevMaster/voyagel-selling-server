/* eslint-disable linebreak-style */
/* eslint-disable indent */
/* eslint-disable linebreak-style */
/* eslint-disable no-await-in-loop */
/* eslint-disable no-plusplus */
/* eslint-disable no-unused-vars */
const express = require('express');
const { PrismaClient } = require('@prisma/client');

// eslint-disable-next-line no-unused-vars
const prisma = new PrismaClient();
const router = express.Router();

router.post('/', async (req, res) => {
  const result = await prisma.deviceAttribution.findMany({
    include: {
        reseau: {
          include: {
            Itinerary: {
              include: {
                rates: true,
                coordinates: true,
              },
            },
            Rubrics: true,
            Subscription: true,
            Controller: true,
          },
        },
        Companie: true,
        device: true,
        operator: true,
        vehicule: {
          include: { Seller: true, Driver: true },
        },
      },
  });
  res.json(result);
});
module.exports = router;
