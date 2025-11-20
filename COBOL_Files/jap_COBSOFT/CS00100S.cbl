      $set sourceformat"free"
       program-id. CS00100S.
      *>=================================================================================
      *>    
      *>                            ログイン画面 - 会社
      *>
      *>=================================================================================
       environment division.
       configuration section.
            special-names. decimal-point is comma.      

       copy CSS00800.cpy. *> Usurios

      *>=================================================================================
       data division.      
       
       copy CSF00800.cpy. *> Usurios
      
      *>=================================================================================      
       working-storage section.
       
       78   c-Version                               value "a".
       78   c-ThisProgram                        value "CS00100S".
       78   c-ProgramDesc                   value "メインメニュー".        
       
       copy CSW00900.cpy.
       
       78   c-User_Yuuzaa-implantacao                  value "IMPLANTACAO". 

       01   ws-WorkFields.
            03 ws-computer-name                    pic x(55).       
      *>=================================================================================
       linkage section. 
 
       copy CSL00900.cpy.
              
       01   lw-Login.
            03 lw-AttemptsNum                    pic 9(02).
            03 lw-UserReturnID               pic x(01).
               88 lw-InvalidLogin                     value "I".
               88 lw-ValidLogin                       value "V".                        
                                                                          
      *>=================================================================================
       procedure division using lnk-par lw-Login.
       
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
       
            perform 9000-Open_Akeru-io-pd00800                
       
       exit.
        
      *>=================================================================================
       2000-Processing_Shori section.
       
            accept ws-data-inv                     from date yyyymmdd
            move ws-dia-inv                        to ws-dia
            move ws-mes-inv                        to ws-mes
            move ws-ano-inv                        to ws-ano
            
            add 01                                 to lw-AttemptsNum
            
            set lw-InvalidLogin                  to true
            
            if   function upper-case(lnk-UserID) equal c-User_Yuuzaa-implantacao
            and  lnk-UserPassword                      equal ws-data
                 set lw-ValidLogin               to true
                 set lnk-MasterLogin              to true            
            else
                 initialize                             f00800-User_Yuuzaa
                 move function numval(lnk-UserID)   to f00800-UserID
                 perform 9000-Read_Yomu-pd00800-ran
                 if   not ws-OperationOK
                 and  not ws-RecordNotFound
                      string "読み取りエラー f00800-User_Yuuzaa - Status [" ws-AccessResult "]" into ws-Message_Messeji
                      perform 9000-Message_Messeji
                      set lnk-WithErrors            to true  
                 end-if
                 
                 if   f00800-UserID equal function numval(lnk-UserID)
                 and  f00800-UserPassword equal lnk-UserPassword
                 and  f00800-Active_Akutibu
                      if   f00800-Development_Kaihatsu
                           set lnk-MasterLogin    to true 
                      end-if
                      move f00800-UserID       to lnk-UserID
                      move f00800-UserName     to lnk-UserName 
                      perform 2100-Update_Koushin-Login
                      set lw-ValidLogin          to true
                 end-if   
            
            end-if 
       
       exit.

      *>=================================================================================
       2100-Update_Koushin-Login section.
       
            accept ws-data-inv                     from date yyyymmdd
            accept ws-Hours                        from time
            
            move ws-data-inv                       to f00800-data-ultimo-Login
            move ws-Hours                          to f00800-Time-ultimo-Login

            display "COMPUTERNAME"                 upon environment-name
            accept ws-computer-name                from environment-value
            
            move ws-computer-name                  to f00800-maquina-Login                         
       
       exit.
       
      *>=================================================================================
       3000-Finalization_Shuryo section.
       
            close pd00800
       
       exit. 
                                                         
      *>=================================================================================
      *> Rotinas Genrias
      
       copy CSP00900.cpy.
        
      *>=================================================================================
      *> 読み取り

       copy CSR00800.cpy. *> Tabelas          
