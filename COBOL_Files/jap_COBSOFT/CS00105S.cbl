      $set sourceformat"free"
       program-id. CS00105S.
      *>=================================================================================
      *>    
      *>                          Busca Prximo Documento NF-e
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.      
        
       copy CSS02200.cpy.

      *>=================================================================================
       data division.      

       copy CSF02200.cpy.
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS00105S".
       78   c-ProgramDesc                   value "PROXIMO DOCUMENTO NFE".

       01   ws-WorkFields.
            03 ws-Number-documento                 pic 9(09).
            03 ws-Series-documento                  pic 9(03).
       
       copy CSW00900.cpy.

      *>=================================================================================
       linkage section.
                 
       copy CSL00900.cpy.
                                                                          
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

            perform 9000-Open_Akeru-io-pd02200
       
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.

            initialize                             f02200-Parameters-nfe
            move lnk-CompanyCode                    to f02200-CompanyCode
            move lnk-BranchCode                     to f02200-BranchCode
            perform 9000-Read_Yomu-pd02200-ran
            if   ws-OperationOK
            and  f02200-CompanyCode equal lnk-CompanyCode
            and  f02200-BranchCode  equal lnk-BranchCode
                 add 1                             to f02200-Number-documento
                 move f02200-Number-documento      to ws-Number-documento
                 move f02200-Series-documento       to ws-Series-documento
                 if   ws-Number-documento equal zeros
                      move 1                       to ws-Number-documento
                      
                      add 1                        to f02200-Series-documento
                      move f02200-Series-documento  to ws-Series-documento                              
                 end-if
            else
                 move 1                            to ws-Number-documento
                 move 1                            to ws-Series-documento                                            
            end-if 

            initialize                             f02200-Parameters-nfe
            move lnk-CompanyCode                    to f02200-CompanyCode
            move lnk-BranchCode                     to f02200-BranchCode
            move ws-Number-documento               to f02200-Number-documento
            move ws-Series-documento                to f02200-Series-documento
            perform 9000-Write_Kaku-pd02200
            if   not ws-OperationOK
                 perform 9000-Rewrite_Kakinaosu-pd02200
                 if   not ws-OperationOK
                      string "書き込みエラー f02200-Parameters-nfe - " ws-AccessResult into ws-Message_Messeji
                      perform 9000-Message_Messeji
                 end-if
            end-if

            move ws-Number-documento               to lnk-Number-documento
            move ws-Series-documento                to lnk-Series-documento
       
       exit.

      *>=================================================================================
       3000-Finalization_Shuryo section.
       
            close pd02200
       
       exit.  
                                                
      *>=================================================================================
      *> Rotinas Genrias

       copy CSP00900.cpy. *> Padro
       copy CSR02200.cpy.