      *>================================================================================= 
       9000-Open_Akeru-i-pd00500 section.
           string lnk-DataPath delimited   by "  " "\EFD005.DAT" into wid-pd00500                             
                                           
           open input pd00500
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD005.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.
       
      *>================================================================================= 
       9000-Open_Akeru-o-pd00500 section.
           string lnk-DataPath delimited   by "  " "\EFD005.DAT" into wid-pd00500                             
                                           
           open output pd00500
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD005.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================================= 
       9000-Open_Akeru-io-pd00500 section.
           string lnk-DataPath delimited   by "  " "\EFD005.DAT" into wid-pd00500                             
                                           
           open i-o pd00500
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD005.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>=================================================================================
       9000-str-pd00500-grt section.
       
            start pd00500 key is greater f00500-chave
       
       exit.

      *>=================================================================================
       9000-str-pd00500-ngrt section.
       
            start pd00500 key is not greater f00500-chave
       
       exit.

      *>=================================================================================
       9000-Read_Yomu-pd00500-ran section.
       
            read pd00500
       
       exit. 

      *>=================================================================================
       9000-Read_Yomu-pd00500-ran-1 section.
       
            read pd00500 key is f00500-chave-1
       
       exit.
        
       *>=================================================================================
       9000-Read_Yomu-pd00500-nex section.
       
            read pd00500 next
       
       exit. 
             
      *>=================================================================================
       9000-Read_Yomu-pd00500-pre section.
       
            read pd00500 previous
       
       exit.              
             
      *>=================================================================================
       9000-Write_Kaku-pd00500 section.
       
            write f00500-District_Chiku
           
       exit.
       
      *>=================================================================================
       9000-Rewrite_Kakinaosu-pd00500 section.
       
            rewrite f00500-District_Chiku
           
       exit.
     