      ******************************************************************
      * Licensed materials - Property of IBM                           *
      * 5724-T07(C) Copyright IBM Corp. 2020                           *
      * All rights reserved                                            *
      * US Government users restricted rights  -  Use, duplication or  *
      * disclosure restricted by GSA ADP schedule contract with IBM    *
      * Corp.                                                          *
      *                                                                *
      * IBM Developer for z/OS (IDz)                                   *
      * IBM z/OS Automated Unit Testing Framework (zUnit)              *
      * Enterprise COBOL zUnit Test Case Sample CALL02.cbl             *
      *                                                                *
      * @since   15.0.0                                                *
      * @version 15.0.0                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TMAIN01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 PARM02.
           COPY CPPARM02.
       01 PARM03.
           COPY CPPARM03.

       01 PARM2.
         05 SNUM10-02    PIC S9(08)V9(02) VALUE 0.
         05 SLNUM10      PIC S9(10) SIGN LEADING VALUE 0.
         05 SBIN09       PIC S9(09) BINARY VALUE 0.
         05 SPACK04      PIC S9(04) COMP-3 VALUE 0.
       01 PARM4          PIC X(4) VALUE "AAAA".
       01 PARM5.
         03 PARM51       PIC 9(2) VALUE 4.
         03 PARM52       PIC X(2) .

       01 PGMSUB02        PIC X(8) VALUE "TSUB02".
       01 PGMSUB03        PIC X(8) VALUE "TSUB03".

       LINKAGE SECTION.
       01 PARM01.
           COPY CPPARM01.

       PROCEDURE DIVISION USING PARM01.

           DISPLAY '*** BEGIN TMAIN01'.

           DISPLAY "ITEM01-01:" ITEM01-01.
           DISPLAY "ITEM01-02:" ITEM01-02.

           EVALUATE ITEM01-01
                WHEN 'AAAAAA'
                    DISPLAY 'ROUTE A'
                WHEN 'BBBBBB'
                    DISPLAY 'ROUTE B'
                WHEN 'CCCCCC'
                    DISPLAY 'ROUTE C'
                WHEN OTHER
                    DISPLAY 'ROUTE OTHER'
           END-EVALUATE.

      * CALL SUB02

           MOVE PARM01 TO PARM02.
           CALL PGMSUB02 USING PARM02.

           DISPLAY "After calling PGMSUB02".
           DISPLAY "  ITEM02-01:" ITEM02-01.
           DISPLAY "  ITEM02-02:" ITEM02-02.

      * CALL SUB03

           MOVE PARM02 TO PARM03.
           CALL PGMSUB03 USING PARM03.

           DISPLAY "After calling PGMSUB03".
           DISPLAY "  ITEM03-01:" ITEM03-01.
           DISPLAY "  ITEM03-02:" ITEM03-02.

           DISPLAY '** END TMAIN01'.

      *****************************************************
           GOBACK.
