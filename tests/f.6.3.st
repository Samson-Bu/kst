FUNCTION_BLOCK AVERAGE
   VAR_INPUT
     RUN : BOOL ;
     XIN : REAL ;
     N   : INT ;
   END_VAR
   VAR_OUTPUT XOUT : REAL ; END_VAR
   VAR SUM  : REAL := 0.0;
       FIFO : DELAY ;
   END_VAR
   SUM := SUM - FIFO.XOUT ;
   FIFO (RUN := RUN , XIN := XIN, N := N) ;
   SUM := SUM + FIFO.XOUT ;
   IF RUN THEN XOUT := SUM/N ;
   ELSE SUM := N*XIN ; XOUT := XIN ;
   END_IF ;
 END_FUNCTION_BLOCK
