       IDENTIFICATION DIVISION.
       PROGRAM-ID. TSUB03.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       LINKAGE SECTION.
       01 PARM03.
           COPY CPPARM03.

       PROCEDURE DIVISION USING PARM03.

           DISPLAY '--- BEGIN TSUB03'

           MOVE "XXXXX" TO ITEM03-01.
           MOVE "YYYYY" TO ITEM03-02.

           DISPLAY '--- END TSUB03'

      *****************************************************
           GOBACK.
