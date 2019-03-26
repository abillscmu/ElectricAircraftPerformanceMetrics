function SERP(range,pax,MTOM)



range=range*1852;
reserveRange=370000;
cruisingAlt=7890;
loiterAlt=5000;
takeOffDistance=500;
rateOfDescent=1.524;
rateOfClimb=8;
payload=0;
battEnergyDensity=100;

#current airplane model: beech king air B100 [close zunum competitor]
airplane=seriesHybridAirplaneMBED(MTOM,battEnergyDensity);
mainMission=missionConstruct(range,cruisingAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
reserve=missionConstruct(reserveRange,loiterAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
airplane.POF=1;

PAXweight=100*9.81*pax;
battweight=(MTOM*(1-.395)*9.81)-PAXweight;
battmass=battweight/9.81;

airplane,mainMission,reserve=flyMission(airplane,mainMission,reserve);
energyused=sum(airplane.powerProfile)/3600;
energyrequired=energyused/.7;
specific_energy=energyrequired/battmass
max_power=maximum(airplane.powerProfile);
    plot(airplane.PowerProfile);
specific_power=max_power/battmass
energyrequired=energyrequired/1000;
return  specific_energy,specific_power,airplane


end