      $set sourceformat"free"
       program-id. CS00000F.
      *>=================================================================================
      *>    
      *>                                Frame Padro
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.
            
      *>=================================================================================
       data division.       
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                                value "a".
       78   c-ThisProgram                         value "CS00000F".
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       
       01   ws-WorkFields.
            03 ws-index-0                          pic 9(001).
            03 ws-ColumnNum                        pic 9(003).
            03 ws-ds-programa                      pic x(116).
            03 filler redefines ws-ds-programa occurs 116 times.
               05 ws-byte-ds-programa              pic x(001).
            03 ws-ds-Function_Kinou                        pic x(019).    
       
       01   f-menu.
            03 Line_Gyou-topo.
               05 filler                           pic x(001)    value all " ".
               05 filler                           pic x(001)    value all "".
               05 filler                           pic x(118)    value all "".
               05 filler                           pic x(001)    value all "".
               05 filler                           pic x(001)    value all " ".
            03 Line_Gyou-programa.
               05 filler                           pic x(001)    value all " ".
               05 filler                           pic x(001)    value all "".
               05 filler                           pic x(001)    value all " ".
               05 Line_Gyou-ds-programa                pic x(116)    value all " ".
               05 filler                           pic x(001)    value all " ".
               05 filler                           pic x(001)    value all "".
               05 filler                           pic x(001)    value all " ".
            03 Line_Gyou-Company_Kaisha.
               05 filler                           pic x(001)    value all " ".
               05 filler                           pic x(001)    value all "".
               05 filler                           pic x(001)    value all " ".
               05 Line_Gyou-CompanyCode                 pic 9(003).
               05 filler                           pic x(001)    value all ".".
               05 Line_Gyou-BranchCode                  pic 9(004).
               05 filler                           pic x(001)    value all " ". 
               05 filler                           pic x(001)    value all "-".
               05 filler                           pic x(001)    value all " ".
               05 Line_Gyou-Name_Namae-Company_Kaisha               pic x(079)    value all " ".
               05 filler                           pic x(001)    value all " ".
               05 Line_Gyou-ProgramCode                pic x(008)    value all " ".
               05 filler                           pic x(001)    value all " ".
               05 filler                           pic x(001)    value all "-".
               05 filler                           pic x(001)    value all " ".
               05 Line_Gyou-vs-programa                pic x(001)    value all " ".
               05 filler                           pic x(001)    value all " ".
               05 filler                           pic x(001)    value all "-".
               05 filler                           pic x(001)    value all " ".
               05 Line_Gyou-dt-sistema                 pic 99/99/9999.
               05 filler                           pic x(001)    value all " ".
               05 filler                           pic x(001)    value all "".
               05 filler                           pic x(001)    value all " ".   
            03 DivisionLine.    
               05 filler                           pic x(001)    value all " ".
               05 filler                           pic x(001)    value all "".
               05 filler                           pic x(118)    value all " ".
               05 filler                           pic x(001)    value all "".
               05 filler                           pic x(001)    value all " ".
            03 Line_Gyou-Function_Kinou.
               05 filler                           pic x(001)    value all " ".
               05 filler                           pic x(001)    value all "".
               05 filler                           pic x(001)    value all " ".
               05 Line_Gyou-funcoes                    pic x(116)    value all " ".
               05 filler                           pic x(001)    value all " ".
               05 filler                           pic x(001)    value all "".
               05 filler                           pic x(001)    value all " ".
            03 Line_Gyou-rodape.
               05 filler                           pic x(001)    value all " ".
               05 filler                           pic x(001)    value all "".
               05 filler                           pic x(118)    value all "".
               05 filler                           pic x(001)    value all "".
               05 filler                           pic x(001)    value all " ".
          
                              
      *>=================================================================================
       linkage section.
       
       copy CSL00900.cpy.
      
      *>=================================================================================
       screen section.
       01   frm-menu-0.
            03 blank screen.
            03 line 02 col 01 pic x(122) from Line_Gyou-topo.
            03 line 03 col 01 pic x(122) from Line_Gyou-programa.
            03 line 04 col 01 pic x(122) from DivisionLine.
            03 line 05 col 01 pic x(122) from Line_Gyou-Company_Kaisha.
            03 line 06 col 01 pic x(122) from Line_Gyou-rodape.
            
            03 line 09 col 01 pic x(122) from Line_Gyou-topo.
            03 line 10 col 01 pic x(122) from DivisionLine.
            03 line 11 col 01 pic x(122) from DivisionLine.
            03 line 12 col 01 pic x(122) from DivisionLine.
            03 line 13 col 01 pic x(122) from DivisionLine.
            03 line 14 col 01 pic x(122) from DivisionLine.
            03 line 15 col 01 pic x(122) from DivisionLine.
            03 line 16 col 01 pic x(122) from DivisionLine.
            03 line 17 col 01 pic x(122) from DivisionLine.
            03 line 18 col 01 pic x(122) from DivisionLine.  
            03 line 19 col 01 pic x(122) from DivisionLine.  
            03 line 20 col 01 pic x(122) from DivisionLine.  
            03 line 21 col 01 pic x(122) from DivisionLine.  
            03 line 22 col 01 pic x(122) from DivisionLine.  
            03 line 23 col 01 pic x(122) from DivisionLine.
            03 line 24 col 01 pic x(122) from DivisionLine.
            03 line 25 col 01 pic x(122) from DivisionLine.
            03 line 26 col 01 pic x(122) from DivisionLine.
            03 line 27 col 01 pic x(122) from DivisionLine.
            03 line 28 col 01 pic x(122) from DivisionLine.
            03 line 29 col 01 pic x(122) from DivisionLine.
            03 line 30 col 01 pic x(122) from DivisionLine.
            03 line 31 col 01 pic x(122) from DivisionLine.
            03 line 32 col 01 pic x(122) from DivisionLine.
            03 line 33 col 01 pic x(122) from DivisionLine.
            03 line 34 col 01 pic x(122) from DivisionLine.
            03 line 35 col 01 pic x(122) from DivisionLine.
            03 line 36 col 01 pic x(122) from DivisionLine.
            03 line 37 col 01 pic x(122) from DivisionLine.
            03 line 38 col 01 pic x(122) from DivisionLine.
            03 line 39 col 01 pic x(122) from DivisionLine.
            03 line 40 col 01 pic x(122) from DivisionLine.
            03 line 41 col 01 pic x(122) from DivisionLine.
            03 line 42 col 01 pic x(122) from DivisionLine.
            03 line 43 col 01 pic x(122) from DivisionLine.
            03 line 44 col 01 pic x(122) from DivisionLine.
            03 line 45 col 01 pic x(122) from DivisionLine.
            03 line 46 col 01 pic x(122) from DivisionLine.
            03 line 47 col 01 pic x(122) from DivisionLine.
            03 line 48 col 01 pic x(122) from DivisionLine.
            03 line 49 col 01 pic x(122) from DivisionLine.
            03 line 45 col 01 pic x(122) from DivisionLine.
            03 line 46 col 01 pic x(122) from DivisionLine.
            03 line 47 col 01 pic x(122) from DivisionLine.
            03 line 48 col 01 pic x(122) from DivisionLine.
            03 line 49 col 01 pic x(122) from DivisionLine.
            03 line 50 col 01 pic x(122) from DivisionLine.
            03 line 51 col 01 pic x(122) from DivisionLine.
            03 line 52 col 01 pic x(122) from DivisionLine.
            03 line 53 col 01 pic x(122) from DivisionLine.
            03 line 54 col 01 pic x(122) from DivisionLine.
            03 line 55 col 01 pic x(122) from DivisionLine.                           
            03 line 56 col 01 pic x(122) from Line_Gyou-rodape.     
                   
       01   frm-menu-1.
            03 blank screen.
            03 line 02 col 01 pic x(122) from Line_Gyou-topo.
            03 line 03 col 01 pic x(122) from Line_Gyou-programa.
            03 line 04 col 01 pic x(122) from DivisionLine.
            03 line 05 col 01 pic x(122) from Line_Gyou-Company_Kaisha.
            03 line 06 col 01 pic x(122) from Line_Gyou-rodape.
            
            03 line 08 col 03 pic x(122) value "INFORME A Option_Opushon DESEJADA (  )".
            
            03 line 09 col 01 pic x(122) from Line_Gyou-topo.
            03 line 10 col 01 pic x(122) from DivisionLine.
            03 line 11 col 01 pic x(122) from DivisionLine.
            03 line 12 col 01 pic x(122) from DivisionLine.
            03 line 13 col 01 pic x(122) from DivisionLine.
            03 line 14 col 01 pic x(122) from DivisionLine.
            03 line 15 col 01 pic x(122) from DivisionLine.
            03 line 16 col 01 pic x(122) from DivisionLine.
            03 line 17 col 01 pic x(122) from DivisionLine.
            03 line 18 col 01 pic x(122) from DivisionLine.  
            03 line 19 col 01 pic x(122) from DivisionLine.  
            03 line 20 col 01 pic x(122) from DivisionLine.  
            03 line 21 col 01 pic x(122) from DivisionLine.  
            03 line 22 col 01 pic x(122) from DivisionLine.  
            03 line 23 col 01 pic x(122) from DivisionLine.
            03 line 24 col 01 pic x(122) from DivisionLine.
            03 line 25 col 01 pic x(122) from DivisionLine.
            03 line 26 col 01 pic x(122) from DivisionLine.
            03 line 27 col 01 pic x(122) from DivisionLine.
            03 line 28 col 01 pic x(122) from DivisionLine.
            03 line 29 col 01 pic x(122) from DivisionLine.
            03 line 30 col 01 pic x(122) from DivisionLine.
            03 line 31 col 01 pic x(122) from DivisionLine.
            03 line 32 col 01 pic x(122) from DivisionLine.
            03 line 33 col 01 pic x(122) from DivisionLine.
            03 line 34 col 01 pic x(122) from DivisionLine.
            03 line 35 col 01 pic x(122) from DivisionLine.
            03 line 36 col 01 pic x(122) from DivisionLine.
            03 line 37 col 01 pic x(122) from DivisionLine.
            03 line 38 col 01 pic x(122) from DivisionLine.
            03 line 39 col 01 pic x(122) from DivisionLine.
            03 line 40 col 01 pic x(122) from DivisionLine.
            03 line 41 col 01 pic x(122) from DivisionLine.
            03 line 42 col 01 pic x(122) from DivisionLine.
            03 line 43 col 01 pic x(122) from DivisionLine.
            03 line 44 col 01 pic x(122) from DivisionLine.
            03 line 45 col 01 pic x(122) from DivisionLine.
            03 line 46 col 01 pic x(122) from DivisionLine.
            03 line 47 col 01 pic x(122) from DivisionLine.
            03 line 48 col 01 pic x(122) from DivisionLine.
            03 line 49 col 01 pic x(122) from DivisionLine.
            03 line 50 col 01 pic x(122) from Line_Gyou-rodape.
            
            03 line 52 col 01 pic x(122) from Line_Gyou-topo.
            03 line 53 col 01 pic x(122) from DivisionLine.
            03 line 54 col 01 pic x(122) from Line_Gyou-Function_Kinou.
            03 line 55 col 01 pic x(122) from DivisionLine.
            03 line 56 col 01 pic x(122) from Line_Gyou-rodape.                                                  
                                                                           
      *>=================================================================================
       procedure division using lnk-par.
       
      *>=================================================================================

       0000-Control_Seigyo section.
            perform 1000-Initialization_Shokika
            perform 2000-Processing_Shori
            perform 3000-Finalization_Shuryo.
       0000-Exit_Deguchi.    
            exit program
            stop run
       exit.
       
      *>=================================================================================
       1000-Initialization_Shokika section.
       
            *> Monta cabealho Padro

            move lnk-CompanyCode                    to Line_Gyou-CompanyCode
            move lnk-BranchCode                     to Line_Gyou-BranchCode
            
            string lnk-razao-social " - " lnk-Name_Namae-fantasia delimited by "  " into Line_Gyou-Name_Namae-Company_Kaisha
            
            move lnk-ProgramCode                   to Line_Gyou-ProgramCode
            move lnk-vs-programa                   to Line_Gyou-vs-programa
            
            move lnk-ds-programa                   to ws-ds-programa
            
            perform varying ws-index-0 from 116 by -1 until ws-index-0 < 1
                 or ws-byte-ds-programa(ws-index-0) not equal spaces
                      continue   
            end-perform
            
            if   ws-index-0 > 0   
                 compute ws-ColumnNum = (116 - ws-index-0)/2
            end-if
            
            move lnk-ds-programa                   to Line_Gyou-ds-programa(ws-ColumnNum:)     
            
            move lnk-data-so                       to Line_Gyou-dt-sistema
            
           *> Monta Rodap Padro
           
            if   lnk-ds-Function_Kinou equal spaces    
                 
                 move 01                                to ws-ColumnNum
                 
                 if   lnk-AllowAdd
                      move "01 - Inclusao"              to ws-ds-Function_Kinou
                      string ws-ds-Function_Kinou               into Line_Gyou-funcoes with pointer ws-ColumnNum 
                 end-if
                 
                 if   lnk-AllowQuery
                      move "02 - Query_Shokai"             to ws-ds-Function_Kinou 
                      string ws-ds-Function_Kinou              into Line_Gyou-funcoes with pointer ws-ColumnNum  
                 end-if
                 
                 if   lnk-AllowMaintenance
                      move "03 - Maintenance_Hozen"            to ws-ds-Function_Kinou 
                      string ws-ds-Function_Kinou               into Line_Gyou-funcoes with pointer ws-ColumnNum
                 end-if
                 
                 if   lnk-permite-Delete_Sakujo
                      move "04 - Delete_Sakujo"              to ws-ds-Function_Kinou
                      string ws-ds-Function_Kinou               into Line_Gyou-funcoes with pointer ws-ColumnNum        
                 end-if 
                 
                 if   lnk-AllowQuery
                      move "05 - Report_Repoto"             to ws-ds-Function_Kinou 
                      string ws-ds-Function_Kinou               into Line_Gyou-funcoes with pointer ws-ColumnNum  
                 end-if
                 
                 move "99 - Return_Modoru"                   to ws-ds-Function_Kinou
                 string ws-ds-Function_Kinou                    into Line_Gyou-funcoes with pointer ws-ColumnNum
            
            else
                 move lnk-ds-Function_Kinou                     to Line_Gyou-funcoes
            end-if
                        
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.
       
            if   lnk-ProgramCode(08:01) equal "M"
            or   lnk-ProgramCode(08:01) equal "P"
            
                 display frm-menu-0
                 
                 if   lnk-ProgramCode(08:01) equal "M"
                      display "INFORME A Option_Opushon DESEJADA (  )" at line 08 col 03
                 end-if   
                                   
            else   
                 display frm-menu-1
            end-if             
       exit.

      *>=================================================================================
       3000-Finalization_Shuryo section.
       
       
       exit.  
                                                       