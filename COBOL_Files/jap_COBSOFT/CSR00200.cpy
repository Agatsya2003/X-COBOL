      *>================================================================================= 
       9000-Open_Akeru-i-pd00200 section.
           string lnk-DataPath delimited   by "  " "\EFD002.DAT" into wid-pd00200                             
                                           
           open input pd00200
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD002.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.
       
      *>================================================================================= 
       9000-Open_Akeru-o-pd00200 section.
           string lnk-DataPath delimited   by "  " "\EFD002.DAT" into wid-pd00200                             
                                           
           open output pd00200
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD002.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================================= 
       9000-Open_Akeru-io-pd00200 section.
           string lnk-DataPath delimited   by "  " "\EFD002.DAT" into wid-pd00200                             
                                           
           open i-o pd00200
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD002.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>=================================================================================
       9000-str-pd00200-grt section.
       
            start pd00200 key is greater f00200-chave
       
       exit.

      *>=================================================================================
       9000-str-pd00200-ngrt section.
       
            start pd00200 key is not greater f00200-chave
       
       exit.
       
      *>=================================================================================
       9000-Read_Yomu-pd00200-ran section.
       
            read pd00200
       
       exit. 

      *>=================================================================================
       9000-Read_Yomu-pd00200-ran-1 section.
       
            read pd00200 key is f00200-chave-1
       
       exit.
        
       *>=================================================================================
       9000-Read_Yomu-pd00200-nex section.
       
            read pd00200 next
       
       exit. 
             
      *>=================================================================================
       9000-Read_Yomu-pd00200-pre section.
       
            read pd00200 previous
       
       exit.              
             
      *>=================================================================================
       9000-Write_Kaku-pd00200 section.
       
            write f00200-Country_Kuni
           
       exit.
       
      *>=================================================================================
       9000-Rewrite_Kakinaosu-pd00200 section.
       
            rewrite f00200-Country_Kuni
           
       exit.
      


