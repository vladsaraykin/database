
CREATE USER test;
-- DROP DATABASE IF EXISTS db_test;
CREATE DATABASE db_test OWNER test ENCODING = 'UTF8' TABLESPACE = pg_default;

-- DROP SCHEMA IF EXISTS test CASCADE;
CREATE SCHEMA AUTHORIZATION test;
-- Sequence: test.sequence_serial

-- DROP SEQUENCE test.sequence_serial;

CREATE SEQUENCE test.sequence_serial
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE test.sequence_serial
  OWNER TO test;

CREATE TABLE test.rekovek_channel ( 
	id                   bigint  NOT NULL,
	parentid             bigint  ,
	elementname          character varying(255) UNIQUE
 );

CREATE TABLE test.rekovek_channel_group ( 
	id                   bigint  NOT NULL,
	parentid             bigint  NOT NULL,
	elementname          character varying(255) UNIQUE
 );


CREATE TABLE test.rekovek_contractor ( 
	id                   bigint  NOT NULL,
	parentid             integer  ,
	elementname          character varying(255) UNIQUE
 );

CREATE TABLE test.rekovek_contractor_group ( 
	id                   bigint  NOT NULL,
	parentid             integer  ,
	elementname          character varying(255) UNIQUE
 );



CREATE TABLE test.rekovek_direction ( 
	id                   bigint  NOT NULL,
	parentid             bigint  ,
	elementname          character varying(255) UNIQUE
 );

CREATE TABLE test.rekovek_direction_group ( 
	id                   bigint  NOT NULL,
	parentid             bigint  ,
	elementname          character varying(255) UNIQUE
 );



CREATE TABLE test.rekovek_modem ( 
	id                   bigint  NOT NULL,
	parentid             bigint  ,
	elementname         character varying(255) UNIQUE
 );

CREATE TABLE test.rekovek_modem_group ( 
	id                   bigint  NOT NULL,
	parentid             bigint  ,
	elementname          character varying(255) UNIQUE
 );


CREATE TABLE test.rekovek_sensor ( 
	id                   bigint  NOT NULL,
	parentid             bigint  ,
	elementname          character varying(255) UNIQUE

 );

CREATE TABLE test.rekovek_sensor_group ( 
	id                   bigint  NOT NULL,
	parentid             bigint  ,
	elementname          character varying(255)UNIQUE
 );


CREATE TABLE test.rekovek_slot ( 
	id                   bigint  NOT NULL,
	parentid             bigint  ,
	elementname          character varying(255) UNIQUE
 );

CREATE TABLE test.rekovek_slot_group ( 
	id                   bigint  NOT NULL,
	parentid             bigint  ,
	elementname          character varying(255) UNIQUE
 );


CREATE TABLE test.rekovek_module ( 
	id                   bigint  NOT NULL,
	parentid             bigint  NOT NULL,
	elementname          character varying(255) UNIQUE
 );



CREATE TABLE test.rekovek_module_group ( 
	id                   bigint  NOT NULL,
	parentid             bigint  NOT NULL,
	elementname          character varying(255) UNIQUE
	
 );


CREATE TABLE test.rekovek_device ( 
	id                   bigint  NOT NULL,
	elementname          character varying(255) UNIQUE
 );

  
  
  --DEVICE
INSERT INTO test.rekovek_device(
            id, elementname)
	select nextval('test.sequence_serial'), 'rekovek_device_1';
	--MODULE GROUP	
INSERT INTO test.rekovek_module_group(
            id, elementname, parentid )
			select nextval('test.sequence_serial'),'Group_module_1', id FROM test.rekovek_device WHERE elementName='rekovek_device_1';
	

	
	--MODULE
INSERT INTO test.rekovek_module(
            id, elementname, parentid )
    select nextval('test.sequence_serial'),'Module_1', id FROM test.rekovek_module_group WHERE elementName='Group_module_1';
INSERT INTO test.rekovek_module(
            id, elementname, parentid )
    select nextval('test.sequence_serial'),'Module_2', id FROM test.rekovek_module_group WHERE elementName='Group_module_1';
INSERT INTO test.rekovek_module(
            id, elementname, parentid )
    select nextval('test.sequence_serial'),'Module_3', id FROM test.rekovek_module_group WHERE elementName='Group_module_1';
	--CHANNEL GROUP
INSERT INTO test.rekovek_channel_group(
            id, elementname , parentid)
    select nextval('test.sequence_serial'),'Channel_group_1', id FROM test.rekovek_module where elementName='Module_1';
INSERT INTO test.rekovek_channel_group(
            id, elementname , parentid)
    select nextval('test.sequence_serial'),'Channel_group_2', id FROM test.rekovek_module where elementName='Module_2';
INSERT INTO test.rekovek_channel_group(
            id, elementname , parentid)
    select nextval('test.sequence_serial'),'Channel_group_3', id FROM test.rekovek_module where elementName='Module_3';	
	--CHANNEL
INSERT INTO test.rekovek_channel(
            id, elementname,parentid )
    select nextval('test.sequence_serial'),'Channel_1', id FROM test.rekovek_channel_group where elementName='Channel_group_1';
	INSERT INTO test.rekovek_channel(
            id, elementname,parentid )
    select nextval('test.sequence_serial'),'Channel_2', id FROM test.rekovek_channel_group where elementName='Channel_group_1';
INSERT INTO test.rekovek_channel(
            id,elementname,parentid)
    select nextval('test.sequence_serial'), 'Channel_3', id FROM test.rekovek_channel_group where elementName='Channel_group_1';
	
INSERT INTO test.rekovek_channel(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'),'Channel_5' , id FROM test.rekovek_channel_group where elementName='Channel_group_2';
INSERT INTO test.rekovek_channel(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'), 'Channel_5', id FROM test.rekovek_channel_group where elementName='Channel_group_2';
INSERT INTO test.rekovek_channel(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'), 'Channel_6', id FROM test.rekovek_channel_group where elementName='Channel_group_2';
	
INSERT INTO test.rekovek_channel(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'), 'Channel_7',  id FROM test.rekovek_channel_group where elementName='Channel_group_3';
INSERT INTO test.rekovek_channel(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'),'Channel_8',id FROM test.rekovek_channel_group where elementName='Channel_group_3';
INSERT INTO test.rekovek_channel(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Channel_9',id FROM test.rekovek_channel_group where elementName='Channel_group_3';
--CONTRACTOR GROUP
INSERT INTO test.rekovek_contractor_group(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'),'Contractor_group_1', id FROM test.rekovek_module where elementName='Module_1';
INSERT INTO test.rekovek_contractor_group(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Contractor_group_2', id FROM test.rekovek_module where elementName='Module_2';
INSERT INTO test.rekovek_contractor_group(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Contractor_group__3', id FROM test.rekovek_module where elementName='Module_3';
--CONTRACTOR
INSERT INTO test.rekovek_contractor(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'),'Contractor_1', id FROM test.rekovek_contractor_group where elementName='Contractor_group_1';
INSERT INTO test.rekovek_contractor(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'), 'Contractor_2', id FROM test.rekovek_contractor_group where elementName='Contractor_group_1';
INSERT INTO test.rekovek_contractor(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'), 'Contractor_3', id FROM test.rekovek_contractor_group where elementName='Contractor_group_1';
	
INSERT INTO test.rekovek_contractor(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Contractor_4', id FROM test.rekovek_contractor_group where elementName='Contractor_group_2';
INSERT INTO test.rekovek_contractor(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'),'Contractor_5', id FROM test.rekovek_contractor_group where elementName='Contractor_group_2';
INSERT INTO test.rekovek_contractor(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'), 'Contractor_6', id FROM test.rekovek_contractor_group where elementName='Contractor_group_2';
	
INSERT INTO test.rekovek_contractor(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Contractor_7', id FROM test.rekovek_contractor_group where elementName='Contractor_group__3';
INSERT INTO test.rekovek_contractor(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'),'Contractor_8', id FROM test.rekovek_contractor_group where elementName='Contractor_group__3';
INSERT INTO test.rekovek_contractor(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'), 'Contractor_9', id FROM test.rekovek_contractor_group where elementName='Contractor_group__3';	
	
--DIRECTION GROUP
INSERT INTO test.rekovek_direction_group(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Direction_group_1', id FROM test.rekovek_module where elementName='Module_1';
INSERT INTO test.rekovek_direction_group(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Direction_group_2', id FROM test.rekovek_module where elementName='Module_2';
INSERT INTO test.rekovek_direction_group(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Direction_group_3', id FROM test.rekovek_module where elementName='Module_3';
	
	
	--DIRECTION
	
	
INSERT INTO test.rekovek_direction(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'), 'Direction_1', id FROM test.rekovek_direction_group where elementName='Direction_group_1';
INSERT INTO test.rekovek_direction(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'), 'Direction_2', id FROM test.rekovek_direction_group where elementName='Direction_group_1';
INSERT INTO test.rekovek_direction(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'), 'Direction_3', id FROM test.rekovek_direction_group where elementName='Direction_group_1';	
	
INSERT INTO test.rekovek_direction(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'), 'Direction_4', id FROM test.rekovek_direction_group where elementName='Direction_group_2';
INSERT INTO test.rekovek_direction(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'), 'Direction_5', id FROM test.rekovek_direction_group where elementName='Direction_group_2';
INSERT INTO test.rekovek_direction(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'), 'Direction_6', id FROM test.rekovek_direction_group where elementName='Direction_group_2';	
	
INSERT INTO test.rekovek_direction(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'), 'Direction_7', id FROM test.rekovek_direction_group where elementName='Direction_group_3';
INSERT INTO test.rekovek_direction(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'), 'Direction_8', id FROM test.rekovek_direction_group where elementName='Direction_group_3';
INSERT INTO test.rekovek_direction(
            id,elementname,  parentid)
    select nextval('test.sequence_serial'), 'Direction_9', id FROM test.rekovek_direction_group where elementName='Direction_group_3';	
	
	--Modem Group
	
INSERT INTO test.rekovek_modem_group(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Modem_group_1', id FROM test.rekovek_module where elementName='Module_1';
INSERT INTO test.rekovek_modem_group(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Modem_group_2', id FROM test.rekovek_module where elementName='Module_2';
INSERT INTO test.rekovek_modem_group(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Modem_group_3', id FROM test.rekovek_module where elementName='Module_3';
	
	--Modem
	
INSERT INTO test.rekovek_modem(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Modem_1',id FROM test.rekovek_modem_group where elementName='Modem_group_1';
INSERT INTO test.rekovek_modem(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Modem_2',id FROM test.rekovek_modem_group where elementName='Modem_group_1';
INSERT INTO test.rekovek_modem(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Modem_3',id FROM test.rekovek_modem_group where elementName='Modem_group_1';
INSERT INTO test.rekovek_modem(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Modem_4',id FROM test.rekovek_modem_group where elementName='Modem_group_2';
INSERT INTO test.rekovek_modem(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Modem_5',id FROM test.rekovek_modem_group where elementName='Modem_group_2';
INSERT INTO test.rekovek_modem(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Modem_6',id FROM test.rekovek_modem_group where elementName='Modem_group_2';
INSERT INTO test.rekovek_modem(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Modem_7',id FROM test.rekovek_modem_group where elementName='Modem_group_3';
INSERT INTO test.rekovek_modem(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Modem_8',id FROM test.rekovek_modem_group where elementName='Modem_group_3';
INSERT INTO test.rekovek_modem(
            id, elementname,  parentid)
    select nextval('test.sequence_serial'),'Modem_9',id FROM test.rekovek_modem_group where elementName='Modem_group_3';

--Sensor group

INSERT INTO test.rekovek_sensor_group(
            id,elementname, parentid)
    select nextval('test.sequence_serial'),'Sensor_group_1',id FROM test.rekovek_module where elementName='Module_1';
	INSERT INTO test.rekovek_sensor_group(
            id,elementname, parentid)
    select nextval('test.sequence_serial'),'Sensor_group_2',id FROM test.rekovek_module where elementName='Module_2';
	INSERT INTO test.rekovek_sensor_group(
            id,elementname, parentid)
    select nextval('test.sequence_serial'),'Sensor_group_3',id FROM test.rekovek_module where elementName='Module_3';

	--Sensor
	
INSERT INTO test.rekovek_sensor(
            id,elementname, parentid)
    select nextval('test.sequence_serial'),'Sensor_1',id FROM test.rekovek_sensor_group where elementName='Sensor_group_1';
INSERT INTO test.rekovek_sensor(
            id,elementname, parentid)
    select nextval('test.sequence_serial'),'Sensor_2',id FROM test.rekovek_sensor_group where elementName='Sensor_group_1';
INSERT INTO test.rekovek_sensor(
            id,elementname, parentid)
    select nextval('test.sequence_serial'),'Sensor_3',id FROM test.rekovek_sensor_group where elementName='Sensor_group_1';
INSERT INTO test.rekovek_sensor(
            id,elementname, parentid)
    select nextval('test.sequence_serial'),'Sensor_4',id FROM test.rekovek_sensor_group where elementName='Sensor_group_2';
INSERT INTO test.rekovek_sensor(
            id,elementname, parentid)
    select nextval('test.sequence_serial'),'Sensor_5',id FROM test.rekovek_sensor_group where elementName='Sensor_group_2';
INSERT INTO test.rekovek_sensor(
            id,elementname, parentid)
    select nextval('test.sequence_serial'),'Sensor_6',id FROM test.rekovek_sensor_group where elementName='Sensor_group_2';
INSERT INTO test.rekovek_sensor(
            id,elementname, parentid)
    select nextval('test.sequence_serial'),'Sensor_7',id FROM test.rekovek_sensor_group where elementName='Sensor_group_3';
INSERT INTO test.rekovek_sensor(
            id,elementname, parentid)
    select nextval('test.sequence_serial'),'Sensor_8',id FROM test.rekovek_sensor_group where elementName='Sensor_group_3';
INSERT INTO test.rekovek_sensor(
            id,elementname, parentid)
    select nextval('test.sequence_serial'),'Sensor_9',id FROM test.rekovek_sensor_group where elementName='Sensor_group_3';
	

	
--Slot group

	
INSERT INTO test.rekovek_slot_group(
            id, elementname, parentid)
    select nextval('test.sequence_serial'),'Slot_group_1',id FROM test.rekovek_module where elementName='Module_1';
	INSERT INTO test.rekovek_slot_group(
            id, elementname, parentid)
    select nextval('test.sequence_serial'),'Slot_group_2',id FROM test.rekovek_module where elementName='Module_2';
	INSERT INTO test.rekovek_slot_group(
            id, elementname, parentid)
    select nextval('test.sequence_serial'),'Slot_group_3',id FROM test.rekovek_module where elementName='Module_3';
	
	--Slot
	
	INSERT INTO test.rekovek_slot(
           id, elementname, parentid)
    select nextval('test.sequence_serial'),'Slot_1',id FROM test.rekovek_slot_group where elementName='Slot_group_1';
	INSERT INTO test.rekovek_slot_group(
           id, elementname, parentid)
    select nextval('test.sequence_serial'),'Slot_2',id FROM test.rekovek_slot_group where elementName='Slot_group_1';
	INSERT INTO test.rekovek_slot_group(
           id, elementname, parentid)
    select nextval('test.sequence_serial'),'Slot_3',id FROM test.rekovek_slot_group where elementName='Slot_group_1';
	INSERT INTO test.rekovek_slot_group(
            id, elementname, parentid)
    select nextval('test.sequence_serial'),'Slot_4',id FROM test.rekovek_slot_group where elementName='Slot_group_2';
	INSERT INTO test.rekovek_slot_group(
            id, elementname, parentid)
    select nextval('test.sequence_serial'),'Slot_5',id FROM test.rekovek_slot_group where elementName='Slot_group_2';
	INSERT INTO test.rekovek_slot_group(
           id, elementname, parentid)
    select nextval('test.sequence_serial'),'Slot_6',id FROM test.rekovek_slot_group where elementName='Slot_group_2';
		INSERT INTO test.rekovek_slot_group(
            id, elementname, parentid)
    select nextval('test.sequence_serial'),'Slot_7',id FROM test.rekovek_slot_group where elementName='Slot_group_3';
	INSERT INTO test.rekovek_slot_group(
            id, elementname, parentid)
    select nextval('test.sequence_serial'),'Slot_8',id FROM test.rekovek_slot_group where elementName='Slot_group_3';
	INSERT INTO test.rekovek_slot_group(
           id, elementname, parentid)
    select nextval('test.sequence_serial'),'Slot_9',id FROM test.rekovek_slot_group where elementName='Slot_group_3';

---SELECT
