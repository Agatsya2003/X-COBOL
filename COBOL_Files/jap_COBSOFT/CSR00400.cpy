      *>================================================================================= 
       9000-Open_Akeru-i-pd00400 section.
           string lnk-DataPath delimited   by "  " "\EFD004.DAT" into wid-pd00400                             
                                           
           open input pd00400
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD004.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.
       
      *>================================================================================= 
       9000-Open_Akeru-o-pd00400 section.
           string lnk-DataPath delimited   by "  " "\EFD004.DAT" into wid-pd00400                             
                                           
           open output pd00400
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD004.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================================= 
       9000-Open_Akeru-io-pd00400 section.
           string lnk-DataPath delimited   by "  " "\EFD004.DAT" into wid-pd00400                             
                                           
           open i-o pd00400
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD004.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>=================================================================================
       9000-str-pd00400-grt section.
       
            start pd00400 key is greater f00400-chave
       
       exit.

      *>=================================================================================
       9000-str-pd00400-ngrt section.
       
            start pd00400 key is not greater f00400-chave
       
       exit.

      *>=================================================================================
       9000-Read_Yomu-pd00400-ran section.
       
            read pd00400
       
       exit. 

      *>=================================================================================
       9000-Read_Yomu-pd00400-ran-1 section.
       
            read pd00400 key is f00400-chave-1
       
       exit.
        
       *>=================================================================================
       9000-Read_Yomu-pd00400-nex section.
       
            read pd00400 next
       
       exit. 
             
      *>=================================================================================
       9000-Read_Yomu-pd00400-pre section.
       
            read pd00400 previous
       
       exit.              
             
      *>=================================================================================
       9000-Write_Kaku-pd00400 section.
       
            write f00400-City_Shichoson
           
       exit.
       
      *>=================================================================================
       9000-Rewrite_Kakinaosu-pd00400 section.
       
            rewrite f00400-City_Shichoson
           
       exit.
     