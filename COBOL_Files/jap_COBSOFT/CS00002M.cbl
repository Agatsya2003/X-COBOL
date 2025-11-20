      $set sourceformat"free"
       program-id. CS00002M.
      *>=================================================================================
      *>    
      *>                           メインメニュー - 在庫
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.
            
       copy CSS00100.cpy. *> Modules_Mojuru
       copy CSS01300.cpy. *> User_Yuuzaa x Modules_Mojuru           

      *>=================================================================================
       data division.
       
       copy CSF00100.cpy. *> Modules_Mojuru
       copy CSF01300.cpy. *> User_Yuuzaa x Modules_Mojuru       
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                                value "a".
       78   c-ThisProgram                         value "CS00002M". 
       78   c-ProgramDesc                    value "Control_Seigyo DE 在庫".        
       
       copy CSC00900.cpy.
       copy CSW00900.cpy.
       
       01   ws-WorkFields.
            03 ws-LineNum                         pic 9(02).
            03 ws-ColumnNum                        pic 9(02).
            03 ws-ProgramCode                      pic x(08).
            03 ws-id-acesso                        pic x(01).
               88 ws-User_Yuuzaa-acesso                     value "S".
               88 ws-User_Yuuzaa-sem-acesso                 value "N".
            03 ws-Line_Gyou-modulo                     pic x(58).
       
      *>=================================================================================
       linkage section.
       
       copy CSL00900.cpy.
      
      *>=================================================================================
       screen section.
                                                    
                                                                           
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
     
            initialize                             wf-FrameOptions
                    
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.
       
            perform until wf-Frame_Furemu-Return_Modoru
                 
                 evaluate wf-Frame_Furemu
                      when 0
                           perform 8000-Screen_Gamen
                      when 9
                           perform 2999-FrameControl     
                      when other
                           move "Frame_Furemu invlido!"  to ws-Message_Messeji
                           perform 9000-Message_Messeji
                           perform 9000-Abort_Chushi
                 end-evaluate
                           
            end-perform
       
       exit.
           
      *>=================================================================================
       2999-FrameControl section.     
            
            perform 8000-accept-Option_Opushon
                 
            if   not wf-Option_Opushon-Return_Modoru   
                 
                 perform 9000-Open_Akeru-io-pd00100
                 perform 9000-Open_Akeru-io-pd01300
                 
                 initialize                   f00100-Modules_Mojuru
                 move lnk-CompanyCode          to f00100-CompanyCode
                 move lnk-BranchCode           to f00100-BranchCode
                 move c-ThisProgram         to f00100-MainProgram
                 move wf-Option_Opushon                to f00100-ProgramOperation
                 perform 9000-Read_Yomu-pd00100-ran-1
                 if   not ws-OperationOK
                 and  not ws-RecordNotFound
                      string "読み取りエラー f00100-Modules_Mojuru - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      perform 9000-Abort_Chushi
                 end-if
                      
                 move f00100-ProgramCode           to ws-ProgramCode
                      
                 if   not lnk-MasterLogin
                      initialize                   f01300-User_Yuuzaa-modulo
                      move lnk-CompanyCode          to f01300-CompanyCode
                      move lnk-BranchCode           to f01300-BranchCode
                      move lnk-UserID          to f01300-UserID
                      move ws-ProgramCode          to f01300-ProgramCode
                      perform 9000-Read_Yomu-pd01300-ran
                      if   not ws-OperationOK
                      and  not ws-RecordNotFound
                           string "読み取りエラー f00100-Modules_Mojuru - Status [" ws-AccessResult "]" into ws-Message_Messeji
                           perform 9000-Message_Messeji
                           perform 9000-Abort_Chushi
                      end-if  
                      
                      move f01300-id-Query_Shokai      to lnk-id-Query_Shokai
                      move f00130-id-inclusao      to lnk-id-inclusao
                      move f01300-id-Maintenance_Hozen    to lnk-id-Maintenance_Hozen
                      move f00130-id-Delete_Sakujo      to lnk-id-Delete_Sakujo
                 else
                      set lnk-AllowQuery     to true
                      set lnk-AllowAdd     to true
                      set lnk-AllowMaintenance   to true
                      set lnk-permite-Delete_Sakujo     to true
                 end-if                         
                 
                 close pd00100
                 close pd01300
                 
                 if   (lnk-AllowQuery or lnk-AllowAdd or lnk-AllowMaintenance or lnk-permite-Delete_Sakujo)    
                 and  ws-ProgramCode not equal spaces   
                      call ws-ProgramCode using lnk-par
                      cancel ws-ProgramCode 
                 end-if
                      
                 set lnk-nao-AllowQuery      to true
                 set lnk-nao-AllowAdd      to true
                 set lnk-nao-AllowMaintenance    to true
                 set lnk-nao-permite-Delete_Sakujo      to true
                 
                 perform 8000-inicia-Frame_Furemu   
                 
            end-if     

            if   wf-Option_Opushon-Return_Modoru
                 set wf-Frame_Furemu-Return_Modoru             to true
            end-if
                   
       exit.
      
      *>=================================================================================
       3000-Finalization_Shuryo section.
       
       
       exit.  
                                                        
      *>=================================================================================
       8000-Screen_Gamen section.
       
            perform 9000-StandardFrame
            
            perform 9000-Open_Akeru-io-pd00100
            perform 9000-Open_Akeru-io-pd01300

            move 11                                to ws-LineNum
            move 04                                to ws-ColumnNum
            
            initialize                             f00100-Modules_Mojuru
            move lnk-CompanyCode                    to f00100-CompanyCode
            move lnk-BranchCode                     to f00100-BranchCode
            move c-ThisProgram                   to f00100-MainProgram
            perform 9000-str-pd00100-grt
            perform 9000-Read_Yomu-pd00100-nex
            perform until not ws-OperationOK
                 or f00100-CompanyCode   <>  lnk-CompanyCode
                 or f00100-BranchCode    <>  lnk-BranchCode
                 
                 if   f00100-MainProgram equal c-ThisProgram
                 
                       if   not lnk-MasterLogin
                            move f00100-ProgramCode     to ws-ProgramCode
                            perform 9000-verifica-acesso
                       end-if
                       
                       if   ws-User_Yuuzaa-acesso
                       or   lnk-MasterLogin                      
                 
                            string f00100-ProgramOperation " - " f00100-ProgramDesc into ws-Line_Gyou-modulo
                 
                            display ws-Line_Gyou-modulo at line ws-LineNum col ws-ColumnNum
                 
                            add 02                       to ws-LineNum
                            
                       end-if     
                 
                 end-if
                   
                 perform 9000-Read_Yomu-pd00100-nex
            end-perform
       
            perform 8000-FrameControl
            
            close pd00100
            close pd01300
            
       exit.
      
      *>=================================================================================
      *> Rotinas Genrias - Frame
 
       copy CSC00903.cpy. *> Frame_Furemu
                               
      *>=================================================================================
      *> Rotinas Genrias
      

       copy CSP00900.cpy. *> Padro
       
      *>=================================================================================
       9000-verifica-acesso section.

            set ws-User_Yuuzaa-sem-acesso              to true
            
            initialize                             f01300-User_Yuuzaa-modulo
            move lnk-CompanyCode                    to f01300-CompanyCode
            move lnk-BranchCode                     to f01300-BranchCode
            move lnk-UserID                    to f01300-UserID
            move ws-ProgramCode                    to f01300-ProgramCode
            perform 9000-Read_Yomu-pd01300-ran
            if   ws-OperationOK
                 set ws-User_Yuuzaa-acesso             to true
            end-if
       
       exit.
             
      *>=================================================================================
      *> 読み取り
      
       copy CSR00100.cpy. *> Modules_Mojuru
       copy CSR01300.cpy. *> User_Yuuzaa x Modules_Mojuru        