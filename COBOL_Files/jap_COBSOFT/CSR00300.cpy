      *>================================================================================= 
       9000-Open_Akeru-i-pd00300 section.
           string lnk-DataPath delimited   by "  " "\EFD003.DAT" into wid-pd00300                             
                                           
           open input pd00300
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD003.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.
       
      *>================================================================================= 
       9000-Open_Akeru-o-pd00300 section.
           string lnk-DataPath delimited   by "  " "\EFD003.DAT" into wid-pd00300                             
                                           
           open output pd00300
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD003.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================================= 
       9000-Open_Akeru-io-pd00300 section.
           string lnk-DataPath delimited   by "  " "\EFD003.DAT" into wid-pd00300                             
                                           
           open i-o pd00300
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD003.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>=================================================================================
       9000-str-pd00300-grt section.
       
            start pd00300 key is greater f00300-chave
       
       exit.

      *>=================================================================================
       9000-str-pd00300-grt-1 section.
       
            start pd00300 key is greater f00300-chave-1
       
       exit.
      *>=================================================================================
       9000-str-pd00300-ngrt section.
       
            start pd00300 key is not greater f00300-chave
       
       exit.       

      *>=================================================================================
       9000-Read_Yomu-pd00300-ran section.
       
            read pd00300
       
       exit. 

      *>=================================================================================
       9000-Read_Yomu-pd00300-ran-1 section.
       
            read pd00300 key is f00300-chave-1
       
       exit.
        
       *>=================================================================================
       9000-Read_Yomu-pd00300-nex section.
       
            read pd00300 next
       
       exit. 
             
      *>=================================================================================
       9000-Read_Yomu-pd00300-pre section.
       
            read pd00300 previous
       
       exit.              
             
      *>=================================================================================
       9000-Write_Kaku-pd00300 section.
       
            write f00300-State_Ken
           
       exit.
       
      *>=================================================================================
       9000-Rewrite_Kakinaosu-pd00300 section.
       
            rewrite f00300-State_Ken
           
       exit.
     