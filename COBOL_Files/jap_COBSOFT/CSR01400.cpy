      *>================================================================================= 
       9000-Open_Akeru-i-pd01400 section.
           string lnk-DataPath delimited   by "  " "\EFD014.DAT" into wid-pd01400                             
                                           
           open input pd01400
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD014.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.
       
      *>================================================================================= 
       9000-Open_Akeru-o-pd01400 section.
           string lnk-DataPath delimited   by "  " "\EFD014.DAT" into wid-pd01400                             
                                           
           open output pd01400
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD014.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================================= 
       9000-Open_Akeru-io-pd01400 section.
           string lnk-DataPath delimited   by "  " "\EFD014.DAT" into wid-pd01400                             
                                           
           open i-o pd01400
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD014.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>=================================================================================
       9000-str-pd01400-grt section.
       
            start pd01400 key is greater f01400-chave
       
       exit.

      *>=================================================================================
       9000-str-pd01400-ngrt section.
       
            start pd01400 key is not greater f01400-chave
       
       exit.

      *>=================================================================================
       9000-str-pd01400-grt-1 section.
       
            start pd01400 key is greater f01400-chave-1
       
       exit.

      *>=================================================================================
       9000-str-pd01400-ngrt-1 section.
       
            start pd01400 key is not greater f01400-chave-1
       
       exit.

      *>=================================================================================
       9000-str-pd01400-grt-2 section.
       
            start pd01400 key is greater f01400-chave-1
       
       exit.

      *>=================================================================================
       9000-str-pd01400-ngrt-2 section.
       
            start pd01400 key is not greater f01400-chave-1
       
       exit.       
       
      *>=================================================================================
       9000-Read_Yomu-pd01400-ran section.
       
            read pd01400
       
       exit. 

      *>=================================================================================
       9000-Read_Yomu-pd01400-ran-1 section.
       
            read pd01400 key is f01400-chave-1
       
       exit.
        
       *>=================================================================================
       9000-Read_Yomu-pd01400-nex section.
       
            read pd01400 next
       
       exit. 
             
      *>=================================================================================
       9000-Read_Yomu-pd01400-pre section.
       
            read pd01400 previous
       
       exit.              
             
      *>=================================================================================
       9000-Write_Kaku-pd01400 section.
       
            write f01400-cliente
           
       exit.
       
      *>=================================================================================
       9000-Rewrite_Kakinaosu-pd01400 section.
       
            rewrite f01400-cliente
           
       exit.
     