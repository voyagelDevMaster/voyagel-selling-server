-- CreateTable
CREATE TABLE "Role" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "name" TEXT,
    "roleId" INTEGER NOT NULL,
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Account" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT,
    "img" TEXT,
    "CompanieId" INTEGER,
    "reseauId" INTEGER,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppConfig" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "ninea" TEXT,
    "rccm" TEXT,
    "logo" TEXT,
    "phone" TEXT,
    "email" TEXT,
    "adress" TEXT,
    "webSite" TEXT,
    "version" TEXT,
    "manager" TEXT,
    "createdAt" TEXT,
    "updatedAt" TEXT,

    CONSTRAINT "AppConfig_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ApiProvider" (
    "id" SERIAL NOT NULL,
    "apiType" TEXT NOT NULL DEFAULT 'Mobile Money',
    "provider" TEXT NOT NULL,
    "apiKey" TEXT NOT NULL,
    "secretKey" TEXT NOT NULL,
    "apiUrl" TEXT NOT NULL,
    "callbackUrl" TEXT,
    "description" TEXT,
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TEXT,

    CONSTRAINT "ApiProvider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "deviceType" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "details" TEXT,
    "price" INTEGER NOT NULL DEFAULT 0,
    "value" INTEGER NOT NULL DEFAULT 100000,
    "avance" INTEGER NOT NULL DEFAULT 0,
    "echeance" INTEGER NOT NULL DEFAULT 0,
    "duration" INTEGER NOT NULL DEFAULT 3,
    "updatedAt" TEXT,

    CONSTRAINT "deviceType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Device" (
    "id" SERIAL NOT NULL,
    "code" TEXT,
    "price" INTEGER NOT NULL DEFAULT 0,
    "isActiveted" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TEXT,
    "typeId" INTEGER NOT NULL,

    CONSTRAINT "Device_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Sim" (
    "id" SERIAL NOT NULL,
    "number" TEXT NOT NULL,
    "imsi" TEXT NOT NULL,
    "provider" TEXT DEFAULT 'ORANGE',
    "price" INTEGER NOT NULL DEFAULT 2000,
    "data" TEXT NOT NULL DEFAULT '3GB',
    "isActiveted" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Sim_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "simDevice" (
    "id" SERIAL NOT NULL,
    "deviceId" INTEGER NOT NULL,
    "simId" INTEGER NOT NULL,

    CONSTRAINT "simDevice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Licence" (
    "id" SERIAL NOT NULL,
    "licenceCode" TEXT,
    "licenceName" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "frequence" TEXT NOT NULL DEFAULT 'Mensuelle',
    "licenceAmount" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Licence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Reseau" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL DEFAULT 'AFTU',
    "name" TEXT NOT NULL,
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TEXT,

    CONSTRAINT "Reseau_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReseauConfig" (
    "id" SERIAL NOT NULL,
    "itinerary" TEXT NOT NULL DEFAULT 'Global',
    "invoicing" TEXT NOT NULL DEFAULT 'Global',
    "depatureDuration" INTEGER NOT NULL DEFAULT 15,
    "agentName" TEXT,
    "agentPhone" TEXT,
    "agentEmail" TEXT,
    "reseauId" INTEGER NOT NULL,

    CONSTRAINT "ReseauConfig_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Companie" (
    "id" SERIAL NOT NULL,
    "categorie" TEXT NOT NULL DEFAULT 'AFTU',
    "gestionType" TEXT NOT NULL DEFAULT 'COMMUNE',
    "name" TEXT NOT NULL,
    "email" TEXT,
    "phone" TEXT,
    "manager" TEXT,
    "adress" TEXT,
    "ninea" TEXT,
    "logo" TEXT,
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TEXT,
    "ReseauId" INTEGER NOT NULL,

    CONSTRAINT "Companie_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Contract" (
    "id" SERIAL NOT NULL,
    "number" TEXT NOT NULL,
    "contractType" TEXT NOT NULL DEFAULT 'COLLECTIF',
    "signator" TEXT NOT NULL,
    "cni" TEXT,
    "quality" TEXT NOT NULL DEFAULT 'Président',
    "bobineQuantity" INTEGER NOT NULL DEFAULT 40,
    "duration" TEXT NOT NULL DEFAULT '1',
    "startDate" TEXT NOT NULL,
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "licenceId" INTEGER NOT NULL,
    "companieId" INTEGER NOT NULL,
    "reseauId" INTEGER NOT NULL,
    "deviceId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Contract_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ContratItem" (
    "id" SERIAL NOT NULL,
    "contractId" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "isPublished" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ContratItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Operator" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT,
    "phone" TEXT,
    "password" TEXT NOT NULL DEFAULT '123456',
    "companieId" INTEGER NOT NULL,
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "reseauId" INTEGER NOT NULL,

    CONSTRAINT "Operator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Vehicule" (
    "id" SERIAL NOT NULL,
    "matricule" TEXT NOT NULL,
    "type" TEXT,
    "isActiveted" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "operatorId" INTEGER NOT NULL,
    "CompanieId" INTEGER NOT NULL,
    "reseauId" INTEGER NOT NULL,

    CONSTRAINT "Vehicule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DeviceAttribution" (
    "id" SERIAL NOT NULL,
    "deviceCode" TEXT,
    "code" TEXT NOT NULL DEFAULT '2023',
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deviceId" INTEGER NOT NULL,
    "operatorId" INTEGER NOT NULL,
    "CompanieId" INTEGER NOT NULL,
    "vehiculeId" INTEGER NOT NULL,
    "reseauId" INTEGER NOT NULL,

    CONSTRAINT "DeviceAttribution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Itinerary" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "distance" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "reseauId" INTEGER NOT NULL,

    CONSTRAINT "Itinerary_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Coordinate" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "latitude" DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    "longitude" DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    "itineraryId" INTEGER NOT NULL,

    CONSTRAINT "Coordinate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rate" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL DEFAULT 0,
    "section" TEXT NOT NULL DEFAULT 'Section 1',
    "itineraryId" INTEGER NOT NULL,

    CONSTRAINT "Rate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rubrics" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "reseauId" INTEGER NOT NULL,

    CONSTRAINT "Rubrics_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubscriptionPlan" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "duration" INTEGER NOT NULL DEFAULT 1,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "reseauId" INTEGER NOT NULL,

    CONSTRAINT "SubscriptionPlan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Controller" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT,
    "password" TEXT,
    "gender" TEXT,
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "ReseauId" INTEGER NOT NULL,

    CONSTRAINT "Controller_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LineManager" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT,
    "password" TEXT,
    "gender" TEXT,
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "ReseauId" INTEGER NOT NULL,

    CONSTRAINT "LineManager_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Regulator" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT,
    "password" TEXT,
    "gender" TEXT,
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "ReseauId" INTEGER NOT NULL,

    CONSTRAINT "Regulator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Seller" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT,
    "gender" TEXT,
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "ReseauId" INTEGER NOT NULL,
    "vehiculeId" INTEGER NOT NULL,
    "operatorId" INTEGER NOT NULL,

    CONSTRAINT "Seller_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Driver" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT,
    "gender" TEXT,
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "ReseauId" INTEGER NOT NULL,
    "vehiculeId" INTEGER NOT NULL,
    "operatorId" INTEGER NOT NULL,

    CONSTRAINT "Driver_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Selling" (
    "id" SERIAL NOT NULL,
    "type" TEXT,
    "sellingDate" TEXT NOT NULL,
    "startTime" TEXT,
    "endTime" TEXT,
    "revenue" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "expense" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "solde" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "ticketCount" INTEGER NOT NULL DEFAULT 0,
    "trajetCount" INTEGER NOT NULL DEFAULT 0,
    "controlsCount" INTEGER NOT NULL DEFAULT 0,
    "isActiveted" BOOLEAN NOT NULL DEFAULT true,
    "sellerId" INTEGER NOT NULL,
    "driverId" INTEGER NOT NULL,
    "itineraryId" INTEGER NOT NULL,
    "deviceId" INTEGER NOT NULL,
    "vehiculeId" INTEGER NOT NULL,
    "operatorId" INTEGER NOT NULL,
    "companieId" INTEGER NOT NULL,
    "reseauId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Selling_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Control" (
    "id" SERIAL NOT NULL,
    "controllerName" TEXT,
    "checkedTickets" INTEGER NOT NULL DEFAULT 0,
    "ticketFraude" INTEGER NOT NULL DEFAULT 0,
    "comment" TEXT,
    "startTime" TEXT,
    "endTime" TEXT,
    "controllerId" INTEGER NOT NULL,
    "trajetId" INTEGER NOT NULL,
    "itineraryId" INTEGER NOT NULL,
    "sellingId" INTEGER NOT NULL,
    "operatorId" INTEGER NOT NULL,
    "CompanieId" INTEGER NOT NULL,
    "vehiculeId" INTEGER NOT NULL,
    "reseauId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Control_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Regulation" (
    "id" SERIAL NOT NULL,
    "vehicules" INTEGER NOT NULL DEFAULT 0,
    "startTime" TIMESTAMP(3),
    "endTime" TIMESTAMP(3),
    "regulatorId" INTEGER NOT NULL,
    "itineraryId" INTEGER NOT NULL,
    "sellingId" INTEGER,
    "CompanieId" INTEGER NOT NULL,
    "reseauId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Regulation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tracking" (
    "id" SERIAL NOT NULL,
    "sellingId" INTEGER NOT NULL,
    "timestamp" TEXT NOT NULL,
    "latitude" DOUBLE PRECISION NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "speed" DOUBLE PRECISION,
    "heading" DOUBLE PRECISION,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Tracking_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Trajet" (
    "id" SERIAL NOT NULL,
    "number" INTEGER NOT NULL DEFAULT 0,
    "trajetId" TEXT,
    "duration" TEXT,
    "departureTime" TEXT NOT NULL,
    "arrivalTime" TEXT,
    "distance" DOUBLE PRECISION DEFAULT 4,
    "sellingId" INTEGER NOT NULL,
    "rising" TEXT NOT NULL,
    "destination" TEXT NOT NULL,
    "revenue" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "isActivated" BOOLEAN NOT NULL DEFAULT true,
    "isOnline" BOOLEAN NOT NULL DEFAULT false,
    "companieId" INTEGER,
    "operatorId" INTEGER NOT NULL,
    "reseauId" INTEGER NOT NULL,

    CONSTRAINT "Trajet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ticket" (
    "id" SERIAL NOT NULL,
    "code" TEXT,
    "price" DOUBLE PRECISION NOT NULL,
    "name" TEXT NOT NULL,
    "validUntil" TEXT,
    "startTime" TEXT NOT NULL,
    "endTime" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Valide',
    "zone" TEXT NOT NULL DEFAULT 'Zone A',
    "isActivated" BOOLEAN NOT NULL DEFAULT true,
    "walletId" INTEGER,
    "tripId" INTEGER NOT NULL,
    "rateId" INTEGER NOT NULL,
    "paymentMethodeId" INTEGER,
    "companieId" INTEGER,
    "sellingId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isOnline" BOOLEAN NOT NULL DEFAULT false,
    "operatorId" INTEGER NOT NULL,
    "reseauId" INTEGER NOT NULL,

    CONSTRAINT "Ticket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rental" (
    "id" SERIAL NOT NULL,
    "Companie" TEXT NOT NULL,
    "CompaniePhone" TEXT,
    "price" DOUBLE PRECISION NOT NULL,
    "destination" TEXT NOT NULL,
    "startTime" TEXT NOT NULL,
    "endTime" TEXT NOT NULL,
    "isActivated" BOOLEAN NOT NULL DEFAULT true,
    "sellingId" INTEGER NOT NULL,
    "companieId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "operatorId" INTEGER NOT NULL,

    CONSTRAINT "Rental_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Costs" (
    "id" SERIAL NOT NULL,
    "rubricsId" INTEGER NOT NULL,
    "name" TEXT,
    "price" DOUBLE PRECISION NOT NULL,
    "sellingId" INTEGER NOT NULL,
    "companieId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "operatorId" INTEGER NOT NULL,
    "reseauId" INTEGER NOT NULL,

    CONSTRAINT "Costs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Passenger" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "cni" TEXT NOT NULL,
    "gender" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Passenger_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Wallet" (
    "id" SERIAL NOT NULL,
    "balance" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "passengerId" INTEGER NOT NULL,

    CONSTRAINT "Wallet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Recharge" (
    "id" SERIAL NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "ref" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'En cours',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "walletId" INTEGER NOT NULL,
    "paymentMethodeId" INTEGER NOT NULL,

    CONSTRAINT "Recharge_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PaymentMethod" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PaymentMethod_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subscription" (
    "id" TEXT NOT NULL,
    "passengerId" INTEGER NOT NULL,
    "startDate" TEXT NOT NULL,
    "endDate" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "planId" INTEGER NOT NULL,
    "reseauId" INTEGER NOT NULL,

    CONSTRAINT "Subscription_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Role_name_key" ON "Role"("name");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Account_userId_key" ON "Account"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "ApiProvider_apiKey_key" ON "ApiProvider"("apiKey");

-- CreateIndex
CREATE UNIQUE INDEX "ApiProvider_secretKey_key" ON "ApiProvider"("secretKey");

-- CreateIndex
CREATE UNIQUE INDEX "Sim_number_key" ON "Sim"("number");

-- CreateIndex
CREATE UNIQUE INDEX "Sim_imsi_key" ON "Sim"("imsi");

-- CreateIndex
CREATE UNIQUE INDEX "simDevice_deviceId_key" ON "simDevice"("deviceId");

-- CreateIndex
CREATE UNIQUE INDEX "simDevice_simId_key" ON "simDevice"("simId");

-- CreateIndex
CREATE UNIQUE INDEX "Reseau_name_key" ON "Reseau"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ReseauConfig_reseauId_key" ON "ReseauConfig"("reseauId");

-- CreateIndex
CREATE UNIQUE INDEX "Companie_email_key" ON "Companie"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Companie_phone_key" ON "Companie"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "Operator_email_key" ON "Operator"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Operator_phone_key" ON "Operator"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "Vehicule_matricule_key" ON "Vehicule"("matricule");

-- CreateIndex
CREATE UNIQUE INDEX "DeviceAttribution_deviceId_key" ON "DeviceAttribution"("deviceId");

-- CreateIndex
CREATE UNIQUE INDEX "Controller_phone_key" ON "Controller"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "Regulator_phone_key" ON "Regulator"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "Seller_phone_key" ON "Seller"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "Driver_phone_key" ON "Driver"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "Passenger_phone_key" ON "Passenger"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "Passenger_email_key" ON "Passenger"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Passenger_cni_key" ON "Passenger"("cni");

-- CreateIndex
CREATE UNIQUE INDEX "Wallet_passengerId_key" ON "Wallet"("passengerId");

-- CreateIndex
CREATE UNIQUE INDEX "PaymentMethod_name_key" ON "PaymentMethod"("name");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_CompanieId_fkey" FOREIGN KEY ("CompanieId") REFERENCES "Companie"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Device" ADD CONSTRAINT "Device_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "deviceType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "simDevice" ADD CONSTRAINT "simDevice_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "Device"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "simDevice" ADD CONSTRAINT "simDevice_simId_fkey" FOREIGN KEY ("simId") REFERENCES "Sim"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReseauConfig" ADD CONSTRAINT "ReseauConfig_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Companie" ADD CONSTRAINT "Companie_ReseauId_fkey" FOREIGN KEY ("ReseauId") REFERENCES "Reseau"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contract" ADD CONSTRAINT "Contract_companieId_fkey" FOREIGN KEY ("companieId") REFERENCES "Companie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contract" ADD CONSTRAINT "Contract_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "deviceType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contract" ADD CONSTRAINT "Contract_licenceId_fkey" FOREIGN KEY ("licenceId") REFERENCES "Licence"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contract" ADD CONSTRAINT "Contract_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ContratItem" ADD CONSTRAINT "ContratItem_contractId_fkey" FOREIGN KEY ("contractId") REFERENCES "Contract"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Operator" ADD CONSTRAINT "Operator_companieId_fkey" FOREIGN KEY ("companieId") REFERENCES "Companie"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Operator" ADD CONSTRAINT "Operator_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vehicule" ADD CONSTRAINT "Vehicule_CompanieId_fkey" FOREIGN KEY ("CompanieId") REFERENCES "Companie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vehicule" ADD CONSTRAINT "Vehicule_operatorId_fkey" FOREIGN KEY ("operatorId") REFERENCES "Operator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vehicule" ADD CONSTRAINT "Vehicule_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeviceAttribution" ADD CONSTRAINT "DeviceAttribution_CompanieId_fkey" FOREIGN KEY ("CompanieId") REFERENCES "Companie"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeviceAttribution" ADD CONSTRAINT "DeviceAttribution_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "Device"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeviceAttribution" ADD CONSTRAINT "DeviceAttribution_operatorId_fkey" FOREIGN KEY ("operatorId") REFERENCES "Operator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeviceAttribution" ADD CONSTRAINT "DeviceAttribution_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeviceAttribution" ADD CONSTRAINT "DeviceAttribution_vehiculeId_fkey" FOREIGN KEY ("vehiculeId") REFERENCES "Vehicule"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Itinerary" ADD CONSTRAINT "Itinerary_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Coordinate" ADD CONSTRAINT "Coordinate_itineraryId_fkey" FOREIGN KEY ("itineraryId") REFERENCES "Itinerary"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rate" ADD CONSTRAINT "Rate_itineraryId_fkey" FOREIGN KEY ("itineraryId") REFERENCES "Itinerary"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rubrics" ADD CONSTRAINT "Rubrics_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubscriptionPlan" ADD CONSTRAINT "SubscriptionPlan_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Controller" ADD CONSTRAINT "Controller_ReseauId_fkey" FOREIGN KEY ("ReseauId") REFERENCES "Reseau"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LineManager" ADD CONSTRAINT "LineManager_ReseauId_fkey" FOREIGN KEY ("ReseauId") REFERENCES "Reseau"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Regulator" ADD CONSTRAINT "Regulator_ReseauId_fkey" FOREIGN KEY ("ReseauId") REFERENCES "Reseau"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Seller" ADD CONSTRAINT "Seller_operatorId_fkey" FOREIGN KEY ("operatorId") REFERENCES "Operator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Seller" ADD CONSTRAINT "Seller_vehiculeId_fkey" FOREIGN KEY ("vehiculeId") REFERENCES "Vehicule"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Seller" ADD CONSTRAINT "Seller_ReseauId_fkey" FOREIGN KEY ("ReseauId") REFERENCES "Reseau"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Driver" ADD CONSTRAINT "Driver_operatorId_fkey" FOREIGN KEY ("operatorId") REFERENCES "Operator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Driver" ADD CONSTRAINT "Driver_vehiculeId_fkey" FOREIGN KEY ("vehiculeId") REFERENCES "Vehicule"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Driver" ADD CONSTRAINT "Driver_ReseauId_fkey" FOREIGN KEY ("ReseauId") REFERENCES "Reseau"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Selling" ADD CONSTRAINT "Selling_driverId_fkey" FOREIGN KEY ("driverId") REFERENCES "Driver"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Selling" ADD CONSTRAINT "Selling_sellerId_fkey" FOREIGN KEY ("sellerId") REFERENCES "Seller"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Selling" ADD CONSTRAINT "Selling_companieId_fkey" FOREIGN KEY ("companieId") REFERENCES "Companie"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Selling" ADD CONSTRAINT "Selling_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "DeviceAttribution"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Selling" ADD CONSTRAINT "Selling_itineraryId_fkey" FOREIGN KEY ("itineraryId") REFERENCES "Itinerary"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Selling" ADD CONSTRAINT "Selling_operatorId_fkey" FOREIGN KEY ("operatorId") REFERENCES "Operator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Selling" ADD CONSTRAINT "Selling_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Selling" ADD CONSTRAINT "Selling_vehiculeId_fkey" FOREIGN KEY ("vehiculeId") REFERENCES "Vehicule"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Control" ADD CONSTRAINT "Control_CompanieId_fkey" FOREIGN KEY ("CompanieId") REFERENCES "Companie"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Control" ADD CONSTRAINT "Control_controllerId_fkey" FOREIGN KEY ("controllerId") REFERENCES "Controller"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Control" ADD CONSTRAINT "Control_itineraryId_fkey" FOREIGN KEY ("itineraryId") REFERENCES "Itinerary"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Control" ADD CONSTRAINT "Control_operatorId_fkey" FOREIGN KEY ("operatorId") REFERENCES "Operator"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Control" ADD CONSTRAINT "Control_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Control" ADD CONSTRAINT "Control_sellingId_fkey" FOREIGN KEY ("sellingId") REFERENCES "Selling"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Control" ADD CONSTRAINT "Control_trajetId_fkey" FOREIGN KEY ("trajetId") REFERENCES "Trajet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Control" ADD CONSTRAINT "Control_vehiculeId_fkey" FOREIGN KEY ("vehiculeId") REFERENCES "Vehicule"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Regulation" ADD CONSTRAINT "Regulation_CompanieId_fkey" FOREIGN KEY ("CompanieId") REFERENCES "Companie"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Regulation" ADD CONSTRAINT "Regulation_itineraryId_fkey" FOREIGN KEY ("itineraryId") REFERENCES "Itinerary"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Regulation" ADD CONSTRAINT "Regulation_regulatorId_fkey" FOREIGN KEY ("regulatorId") REFERENCES "Regulator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Regulation" ADD CONSTRAINT "Regulation_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tracking" ADD CONSTRAINT "Tracking_sellingId_fkey" FOREIGN KEY ("sellingId") REFERENCES "Selling"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trajet" ADD CONSTRAINT "Trajet_sellingId_fkey" FOREIGN KEY ("sellingId") REFERENCES "Selling"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trajet" ADD CONSTRAINT "Trajet_companieId_fkey" FOREIGN KEY ("companieId") REFERENCES "Companie"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trajet" ADD CONSTRAINT "Trajet_operatorId_fkey" FOREIGN KEY ("operatorId") REFERENCES "Operator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trajet" ADD CONSTRAINT "Trajet_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_rateId_fkey" FOREIGN KEY ("rateId") REFERENCES "Rate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_paymentMethodeId_fkey" FOREIGN KEY ("paymentMethodeId") REFERENCES "PaymentMethod"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_sellingId_fkey" FOREIGN KEY ("sellingId") REFERENCES "Selling"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_tripId_fkey" FOREIGN KEY ("tripId") REFERENCES "Trajet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES "Wallet"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_companieId_fkey" FOREIGN KEY ("companieId") REFERENCES "Companie"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_operatorId_fkey" FOREIGN KEY ("operatorId") REFERENCES "Operator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rental" ADD CONSTRAINT "Rental_sellingId_fkey" FOREIGN KEY ("sellingId") REFERENCES "Selling"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rental" ADD CONSTRAINT "Rental_companieId_fkey" FOREIGN KEY ("companieId") REFERENCES "Companie"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rental" ADD CONSTRAINT "Rental_operatorId_fkey" FOREIGN KEY ("operatorId") REFERENCES "Operator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Costs" ADD CONSTRAINT "Costs_rubricsId_fkey" FOREIGN KEY ("rubricsId") REFERENCES "Rubrics"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Costs" ADD CONSTRAINT "Costs_sellingId_fkey" FOREIGN KEY ("sellingId") REFERENCES "Selling"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Costs" ADD CONSTRAINT "Costs_companieId_fkey" FOREIGN KEY ("companieId") REFERENCES "Companie"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Costs" ADD CONSTRAINT "Costs_operatorId_fkey" FOREIGN KEY ("operatorId") REFERENCES "Operator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Costs" ADD CONSTRAINT "Costs_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wallet" ADD CONSTRAINT "Wallet_passengerId_fkey" FOREIGN KEY ("passengerId") REFERENCES "Passenger"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Recharge" ADD CONSTRAINT "Recharge_paymentMethodeId_fkey" FOREIGN KEY ("paymentMethodeId") REFERENCES "PaymentMethod"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Recharge" ADD CONSTRAINT "Recharge_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES "Wallet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_passengerId_fkey" FOREIGN KEY ("passengerId") REFERENCES "Passenger"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_planId_fkey" FOREIGN KEY ("planId") REFERENCES "SubscriptionPlan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_reseauId_fkey" FOREIGN KEY ("reseauId") REFERENCES "Reseau"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
