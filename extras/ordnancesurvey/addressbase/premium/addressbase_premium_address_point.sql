-- View: addressbase_premium.address_point


CREATE OR REPLACE VIEW addressbase_premium.address_point AS
 SELECT deliverypointaddress.udprn AS OSAPR,
		deliverypointaddress.departmentname AS departmentname,
		deliverypointaddress.poboxnumber AS poboxnumber,
		deliverypointaddress.organisationname AS organisationname,
		deliverypointaddress.buildingnumber AS buildingnumber,
		deliverypointaddress.subbuildingname AS subbuildingname,
		deliverypointaddress.buildingname AS buildingname,
		deliverypointaddress.thoroughfare AS thoroughfare,
		deliverypointaddress.dependentthoroughfare AS dependentthoroughfare,
		deliverypointaddress.posttown AS posttown,
		deliverypointaddress.dependentlocality AS dependentlocality,
		deliverypointaddress.doubledependentlocality AS doubledependentlocality,
		NULL AS county,
		replace(deliverypointaddress.postcode, ' ','') AS postcode,
		round(st_x(blpu.wkb_geometry)*10) as X,
		round(st_y(blpu.wkb_geometry)*10) as Y,
		NULL AS source_flag,
		blpu.changetype AS changetype,
		replace(deliverypointaddress.lastupdatedate, '-', '') AS lastupdatedate,
		replace(deliverypointaddress.processdate, '-', '') AS processdate
   FROM addressbase_premium.deliverypointaddress deliverypointaddress
   LEFT JOIN addressbase_premium.basiclandpropertyunit blpu ON deliverypointaddress.uprn = blpu.uprn;
COMMENT ON VIEW addressbase_premium.address_point
  IS 'AddressBase Premium formatted to look similar to AddressPoint

     Author: Andy Berry
     www.dragontail.co.uk
     Version 1.2 03-07-2014

';

