      *>================================================================================= 
       9000-Open_Akeru-i-pd00600 section.
           string lnk-DataPath delimited   by "  " "\EFD006.DAT" into wid-pd00600                             
                                           
           open input pd00600
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD006.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.
       
      *>================================================================================= 
       9000-Open_Akeru-o-pd00600 section.
           string lnk-DataPath delimited   by "  " "\EFD006.DAT" into wid-pd00600                             
                                           
           open output pd00600
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD006.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================================= 
       9000-Open_Akeru-io-pd00600 section.
           string lnk-DataPath delimited   by "  " "\EFD006.DAT" into wid-pd00600                             
                                           
           open i-o pd00600
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD006.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>=================================================================================
       9000-str-pd00600-grt section.
       
            start pd00600 key is greater f00600-chave
       
       exit.

      *>=================================================================================
       9000-str-pd00600-ngrt section.
       
            start pd00600 key is not greater f00600-chave
       
       exit.

      *>=================================================================================
       9000-str-pd00600-grt-1 section.
       
            start pd00600 key is greater f00600-chave-1
       
       exit.

      *>=================================================================================
       9000-str-pd00600-ngrt-1 section.
       
            start pd00600 key is not greater f00600-chave-1
       
       exit.

      *>=================================================================================
       9000-str-pd00600-grt-2 section.
       
            start pd00600 key is greater f00600-chave-2
       
       exit.

      *>=================================================================================
       9000-str-pd00600-ngrt-2 section.
       
            start pd00600 key is not greater f00600-chave-2
       
       exit.       
       
      *>=================================================================================
       9000-Read_Yomu-pd00600-ran section.
       
            read pd00600
       
       exit. 

      *>=================================================================================
       9000-Read_Yomu-pd00600-ran-1 section.
       
            read pd00600 key is f00600-chave-1
       
       exit.
        
       *>=================================================================================
       9000-Read_Yomu-pd00600-nex section.
       
            read pd00600 next
       
       exit. 
             
      *>=================================================================================
       9000-Read_Yomu-pd00600-pre section.
       
            read pd00600 previous
       
       exit.              
             
      *>=================================================================================
       9000-Write_Kaku-pd00600 section.
       
            write f00600-Street_Jusho
           
       exit.
       
      *>=================================================================================
       9000-Rewrite_Kakinaosu-pd00600 section.
       
            rewrite f00600-Street_Jusho
           
       exit.
     