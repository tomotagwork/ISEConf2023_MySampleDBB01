       IDENTIFICATION DIVISION.
       PROGRAM-ID. TSUB02.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       LINKAGE SECTION.
       01 PARM02.
           COPY CPPARM02.

       PROCEDURE DIVISION USING PARM02.

           DISPLAY '--- BEGIN TSUB02'

           MOVE "11111" TO ITEM02-01.
           MOVE "22222" TO ITEM02-02.

           DISPLAY '--- END TSUB02'

      *****************************************************
           GOBACK.
