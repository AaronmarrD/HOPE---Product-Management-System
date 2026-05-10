-- =====================================================
-- HopeDB Schema - Core Business Tables
-- Run this script first in Supabase SQL Editor
-- =====================================================

-- Create table DEPARTMENT
CREATE TABLE department (
  deptCode VARCHAR(3) NOT NULL PRIMARY KEY,
  deptName VARCHAR(30)
);

-- Insert DEPARTMENT rows
INSERT INTO department VALUES('ACC', 'Accounting');
INSERT INTO department VALUES('FIN', 'Finance');
INSERT INTO department VALUES('HRM', 'Human Resource');
INSERT INTO department VALUES('MKT', 'Marketing');
INSERT INTO department VALUES('OPR', 'Operations');
INSERT INTO department VALUES('PUR', 'Purchasing');
INSERT INTO department VALUES('SAL', 'Sales');

-- Create table JOB
CREATE TABLE job (
  jobCode VARCHAR(3) NOT NULL PRIMARY KEY,
  jobDesc VARCHAR(25),
  minSal DECIMAL(10,2),
  maxSal DECIMAL(10,2)
);

-- Insert JOB rows
INSERT INTO job VALUES('ACC', 'Accountant', 25000, 45000);
INSERT INTO job VALUES('ADM', 'Admin. Assistant', 15000, 30000);
INSERT INTO job VALUES('CEO', 'Chief Executive Officer', 100000, 250000);
INSERT INTO job VALUES('CFO', 'Chief Financial Officer', 75000, 150000);
INSERT INTO job VALUES('CIO', 'Chief Information Officer', 75000, 150000);
INSERT INTO job VALUES('COO', 'Chief Operating Officer', 75000, 150000);
INSERT INTO job VALUES('ENG', 'Engineer', 40000, 80000);
INSERT INTO job VALUES('MAN', 'Manager', 35000, 65000);
INSERT INTO job VALUES('PRE', 'President', 120000, 300000);
INSERT INTO job VALUES('SAL', 'Sales Representative', 18000, 35000);

-- Create table EMPLOYEE
CREATE TABLE employee (
  empNo VARCHAR(5) NOT NULL PRIMARY KEY,
  lastName VARCHAR(15),
  firstName VARCHAR(15),
  initial VARCHAR(1),
  jobCode VARCHAR(3) REFERENCES job,
  hireDate DATE,
  managerEmpNo VARCHAR(5) REFERENCES employee,
  deptCode VARCHAR(3) REFERENCES department
);

-- Insert EMPLOYEE rows (sample data)
INSERT INTO employee VALUES('10001', 'Morales', 'Bonnie', 'K', 'PRE', '1993-12-27', NULL, 'OPR');
INSERT INTO employee VALUES('10002', 'Washington', 'Ralph', 'B', 'CEO', '1989-06-22', '10001', 'OPR');
INSERT INTO employee VALUES('10003', 'Smith', 'Larry', 'W', 'CFO', '1997-07-18', '10001', 'FIN');
INSERT INTO employee VALUES('10004', 'Rodriguez', 'Carlos', 'J', 'CIO', '1996-03-15', '10001', 'OPR');
INSERT INTO employee VALUES('10005', 'Alonzo', 'Armando', 'O', 'COO', '1993-02-08', '10001', 'OPR');

-- Create table JOBHISTORY
CREATE TABLE jobHistory (
  empNo VARCHAR(5) NOT NULL REFERENCES employee,
  startDate DATE NOT NULL,
  endDate DATE,
  jobCode VARCHAR(3) REFERENCES job,
  deptCode VARCHAR(3) REFERENCES department,
  PRIMARY KEY (empNo, startDate)
);

-- Create table CUSTOMER
CREATE TABLE customer (
  custCode VARCHAR(5) NOT NULL PRIMARY KEY,
  custName VARCHAR(35),
  custStreet VARCHAR(30),
  custCity VARCHAR(20),
  custState VARCHAR(2),
  custZip VARCHAR(10),
  custBal DECIMAL(10,2)
);

-- Insert CUSTOMER rows (sample data)
INSERT INTO customer VALUES('10010', 'Ramas', 'Tagaytay', 'Tagaytay', 'CV', '4120', 0);
INSERT INTO customer VALUES('10011', 'Dunne', 'Makati', 'Makati', 'MM', '1200', 0);
INSERT INTO customer VALUES('10012', 'Smith', 'Quezon City', 'Quezon City', 'MM', '1100', 345.86);
INSERT INTO customer VALUES('10013', 'Olowski', 'Pasig', 'Pasig', 'MM', '1600', 536.75);
INSERT INTO customer VALUES('10014', 'Orlando', 'Pasay', 'Pasay', 'MM', '1300', 0);

-- Create table PRODUCT
CREATE TABLE product (
  prodCode VARCHAR(6) NOT NULL PRIMARY KEY,
  description VARCHAR(35),
  unit VARCHAR(4)
);

-- Insert PRODUCT rows
INSERT INTO product VALUES('AD0001', 'Adapter, HDMI to VGA', 'pc');
INSERT INTO product VALUES('AD0002', 'Adapter, USB-C to USB 3.0', 'pc');
INSERT INTO product VALUES('AD0003', 'Adapter, Lightning to 3.5mm', 'pc');
INSERT INTO product VALUES('AD0004', 'Adapter, DisplayPort to HDMI', 'pc');
INSERT INTO product VALUES('AK0001', 'Keyboard, Mechanical RGB', 'pc');
INSERT INTO product VALUES('AK0002', 'Keyboard, Wireless Slim', 'pc');
INSERT INTO product VALUES('AK0003', 'Keyboard, Gaming Backlit', 'pc');
INSERT INTO product VALUES('AM0001', 'Mouse, Wireless Optical', 'pc');
INSERT INTO product VALUES('AM0002', 'Mouse, Gaming RGB', 'pc');
INSERT INTO product VALUES('AM0003', 'Mouse, Bluetooth Portable', 'pc');
INSERT INTO product VALUES('AM0004', 'Mouse, Ergonomic Vertical', 'pc');
INSERT INTO product VALUES('AM0005', 'Mouse, Trackball Wireless', 'pc');
INSERT INTO product VALUES('AP0001', 'Printer, Laser Monochrome', 'unit');
INSERT INTO product VALUES('AP0002', 'Printer, Inkjet Color', 'unit');
INSERT INTO product VALUES('AP0003', 'Printer, All-in-One Scanner', 'unit');
INSERT INTO product VALUES('MD0001', 'Monitor, 24" Full HD', 'unit');
INSERT INTO product VALUES('MD0002', 'Monitor, 27" QHD IPS', 'unit');
INSERT INTO product VALUES('MD0003', 'Monitor, 32" 4K UHD', 'unit');
INSERT INTO product VALUES('MD0004', 'Monitor, 21.5" LED', 'unit');
INSERT INTO product VALUES('MD0005', 'Monitor, 34" Ultrawide Curved', 'unit');
INSERT INTO product VALUES('MD0006', 'Monitor, 27" Gaming 144Hz', 'unit');
INSERT INTO product VALUES('MP0001', 'Mobile Phone, Android 128GB', 'unit');
INSERT INTO product VALUES('MP0002', 'Mobile Phone, iPhone 256GB', 'unit');
INSERT INTO product VALUES('MP0003', 'Mobile Phone, Budget 64GB', 'unit');
INSERT INTO product VALUES('MP0004', 'Mobile Phone, Flagship 512GB', 'unit');
INSERT INTO product VALUES('NB0001', 'Notebook, 14" Core i5 8GB', 'unit');
INSERT INTO product VALUES('NB0002', 'Notebook, 15.6" Core i7 16GB', 'unit');
INSERT INTO product VALUES('NB0003', 'Notebook, 13" Ultrabook', 'unit');
INSERT INTO product VALUES('NB0004', 'Notebook, 17" Gaming RTX', 'unit');
INSERT INTO product VALUES('NB0005', 'Notebook, 14" Ryzen 5 8GB', 'unit');
INSERT INTO product VALUES('NT0001', 'Tablet, 10.1" Android 64GB', 'unit');
INSERT INTO product VALUES('NT0002', 'Tablet, 11" iPad Pro 128GB', 'unit');
INSERT INTO product VALUES('NT0003', 'Tablet, 8" Budget 32GB', 'unit');
INSERT INTO product VALUES('NT0004', 'Tablet, 12.9" iPad Pro 256GB', 'unit');
INSERT INTO product VALUES('NT0005', 'Tablet, 10.5" Windows 128GB', 'unit');
INSERT INTO product VALUES('NT0006', 'Tablet, 7" Kids Edition', 'unit');
INSERT INTO product VALUES('PA0001', 'Pad, Mouse Gaming XXL', 'pc');
INSERT INTO product VALUES('PA0002', 'Pad, Mouse Gel Wrist Rest', 'pc');
INSERT INTO product VALUES('PC0001', 'Desktop PC, Core i5 8GB 512GB', 'unit');
INSERT INTO product VALUES('PC0002', 'Desktop PC, Core i7 16GB 1TB', 'unit');
INSERT INTO product VALUES('PC0003', 'Desktop PC, Ryzen 5 8GB 512GB', 'unit');
INSERT INTO product VALUES('PC0004', 'Desktop PC, Gaming i9 32GB RTX', 'unit');
INSERT INTO product VALUES('PF0001', 'Flash Drive, 32GB USB 3.0', 'pc');
INSERT INTO product VALUES('PF0002', 'Flash Drive, 64GB USB 3.1', 'pc');
INSERT INTO product VALUES('PF0003', 'Flash Drive, 16GB USB 2.0', 'pc');
INSERT INTO product VALUES('PF0004', 'Flash Drive, 128GB USB-C', 'pc');
INSERT INTO product VALUES('PF0005', 'Flash Drive, 256GB USB 3.2', 'pc');
INSERT INTO product VALUES('PF0006', 'Flash Drive, 8GB USB 2.0', 'pc');
INSERT INTO product VALUES('PR0001', 'Router, Dual-Band AC1200', 'unit');
INSERT INTO product VALUES('PR0002', 'Router, Tri-Band AX6000', 'unit');
INSERT INTO product VALUES('PR0003', 'Router, Mesh WiFi 6 System', 'unit');
INSERT INTO product VALUES('PS0001', 'Playstation 5 Console', 'unit');
INSERT INTO product VALUES('PS0002', 'Playstation 5 Controller', 'pc');
INSERT INTO product VALUES('PS0003', 'Playstation VR Headset', 'unit');

-- Create table SALES
CREATE TABLE sales (
  transno VARCHAR(8) NOT NULL PRIMARY KEY,
  custCode VARCHAR(5) REFERENCES customer,
  transDate DATE,
  empNo VARCHAR(5) REFERENCES employee
);

-- Create table SALESDETAIL
CREATE TABLE salesDetail (
  transno VARCHAR(8) NOT NULL REFERENCES sales,
  prodCode VARCHAR(6) NOT NULL REFERENCES product,
  quantity INT,
  PRIMARY KEY (transno, prodCode)
);

-- Create table PAYMENT
CREATE TABLE payment (
  orNo VARCHAR(8) NOT NULL PRIMARY KEY,
  payDate DATE,
  amount DECIMAL(10,2),
  transno VARCHAR(8) REFERENCES sales
);

-- Create table PRICEHIST
CREATE TABLE priceHist (
  effDate DATE NOT NULL,
  prodCode VARCHAR(6) NOT NULL REFERENCES product,
  unitPrice DECIMAL(10,2) CONSTRAINT unitP_ck CHECK (unitPrice > 0),
  PRIMARY KEY (effDate, prodCode)
);

-- Insert sample price history
INSERT INTO priceHist VALUES('2010-05-15', 'AD0001', 58);
INSERT INTO priceHist VALUES('2010-05-15', 'AD0002', 69.99);
INSERT INTO priceHist VALUES('2010-05-15', 'AD0003', 54.44);
INSERT INTO priceHist VALUES('2010-05-15', 'AD0004', 71.99);
INSERT INTO priceHist VALUES('2010-05-15', 'AK0001', 12);
INSERT INTO priceHist VALUES('2010-05-15', 'AK0002', 8.37);
INSERT INTO priceHist VALUES('2010-05-15', 'AK0003', 99.99);
INSERT INTO priceHist VALUES('2010-05-15', 'AM0001', 36.45);
INSERT INTO priceHist VALUES('2010-05-15', 'AM0002', 69.26);
INSERT INTO priceHist VALUES('2010-05-15', 'AM0003', 20.43);
INSERT INTO priceHist VALUES('2010-05-15', 'AM0004', 88.14);
INSERT INTO priceHist VALUES('2010-05-15', 'AM0005', 49.27);
INSERT INTO priceHist VALUES('2010-05-15', 'AP0001', 299.99);
INSERT INTO priceHist VALUES('2010-05-15', 'AP0002', 304.48);
INSERT INTO priceHist VALUES('2010-05-15', 'AP0003', 349.99);
INSERT INTO priceHist VALUES('2010-05-15', 'MD0001', 119.68);
INSERT INTO priceHist VALUES('2010-05-15', 'MD0002', 149.99);
INSERT INTO priceHist VALUES('2010-05-15', 'MD0003', 239.96);
INSERT INTO priceHist VALUES('2010-05-15', 'MD0004', 132.21);
INSERT INTO priceHist VALUES('2010-05-15', 'MD0005', 825);
INSERT INTO priceHist VALUES('2010-05-15', 'MD0006', 124.29);
INSERT INTO priceHist VALUES('2010-05-15', 'MP0001', 199.95);
INSERT INTO priceHist VALUES('2010-05-15', 'MP0002', 126.72);
INSERT INTO priceHist VALUES('2010-05-15', 'MP0003', 425);
INSERT INTO priceHist VALUES('2010-05-15', 'MP0004', 302);
INSERT INTO priceHist VALUES('2010-05-15', 'NB0001', 300);
INSERT INTO priceHist VALUES('2010-05-15', 'NB0002', 298);
INSERT INTO priceHist VALUES('2010-05-15', 'NB0003', 199);
INSERT INTO priceHist VALUES('2010-05-15', 'NB0004', 279);
INSERT INTO priceHist VALUES('2010-05-15', 'NB0005', 1184.72);
INSERT INTO priceHist VALUES('2010-05-15', 'NT0001', 412.49);
INSERT INTO priceHist VALUES('2010-05-15', 'NT0002', 324.99);
INSERT INTO priceHist VALUES('2010-05-15', 'NT0003', 287);
INSERT INTO priceHist VALUES('2010-05-15', 'NT0004', 219.89);
INSERT INTO priceHist VALUES('2010-05-15', 'NT0005', 499.99);
INSERT INTO priceHist VALUES('2010-05-15', 'NT0006', 57.99);
INSERT INTO priceHist VALUES('2010-05-15', 'PA0001', 219);
INSERT INTO priceHist VALUES('2010-05-15', 'PA0002', 102.99);
INSERT INTO priceHist VALUES('2010-05-15', 'PC0001', 499.99);
INSERT INTO priceHist VALUES('2010-05-15', 'PC0002', 179.99);
INSERT INTO priceHist VALUES('2010-05-15', 'PC0003', 390);
INSERT INTO priceHist VALUES('2010-05-15', 'PC0004', 538);
INSERT INTO priceHist VALUES('2010-05-15', 'PF0001', 123.75);
INSERT INTO priceHist VALUES('2010-05-15', 'PF0002', 64.25);
INSERT INTO priceHist VALUES('2010-05-15', 'PF0003', 28.87);
INSERT INTO priceHist VALUES('2010-05-15', 'PF0004', 92.85);
INSERT INTO priceHist VALUES('2010-05-15', 'PF0005', 119);
INSERT INTO priceHist VALUES('2010-05-15', 'PF0006', 7.5);
INSERT INTO priceHist VALUES('2010-05-15', 'PR0001', 81.72);
INSERT INTO priceHist VALUES('2010-05-15', 'PR0002', 99.99);
INSERT INTO priceHist VALUES('2010-05-15', 'PR0003', 123);
INSERT INTO priceHist VALUES('2010-05-15', 'PS0001', 3200);
INSERT INTO priceHist VALUES('2010-05-15', 'PS0002', 699.99);
INSERT INTO priceHist VALUES('2010-05-15', 'PS0003', 599.99);

-- Add record_status and stamp columns to product table
ALTER TABLE product ADD COLUMN record_status VARCHAR(10) DEFAULT 'ACTIVE';
ALTER TABLE product ADD COLUMN stamp TEXT;

-- Add record_status and stamp columns to priceHist table
ALTER TABLE priceHist ADD COLUMN record_status VARCHAR(10) DEFAULT 'ACTIVE';
ALTER TABLE priceHist ADD COLUMN stamp TEXT;

-- Update existing products to ACTIVE status
UPDATE product SET record_status = 'ACTIVE', stamp = 'INITIAL SYSTEM 2024-01-01 00:00';
UPDATE priceHist SET record_status = 'ACTIVE', stamp = 'INITIAL SYSTEM 2024-01-01 00:00';
