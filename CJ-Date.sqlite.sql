CREATE TABLE supplier (
  sid     varchar(5)   NOT NULL primary key,
  sname   varchar(10)  NOT NULL,
  status  int          NOT NULL,
  city    varchar(10)  NOT NULL
);

CREATE TABLE part (
  pid     varchar(5)   NOT NULL primary key,
  pname   varchar(10)  NOT NULL,
  color   int          NOT NULL,
  weight  real         NOT NULL,
  city    varchar(10)  NOT NULL
);

CREATE TABLE shipment (
  sid     varchar(5)   NOT NULL,
  pid     varchar(5)   NOT NULL,
  qty     int          NOT NULL,
  FOREIGN KEY(sid) REFERENCES supplier(sid),
  FOREIGN KEY(pid) REFERENCES parts(pid),
  PRIMARY KEY (sid, pid)
);

