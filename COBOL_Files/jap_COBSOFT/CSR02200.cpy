      *>================================================================================= 
       9000-Open_Akeru-i-pd02200 section.
           string lnk-DataPath delimited   by "  " "\EFD022.DAT" into wid-pd02200                             
                                           
           open input pd02200
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD022.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.
       
      *>================================================================================= 
       9000-Open_Akeru-o-pd02200 section.
           string lnk-DataPath delimited   by "  " "\EFD022.DAT" into wid-pd02200                             
                                           
           open output pd02200
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD022.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================================= 
       9000-Open_Akeru-io-pd02200 section.
           string lnk-DataPath delimited   by "  " "\EFD022.DAT" into wid-pd02200                             
                                           
           open i-o pd02200
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD022.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>=================================================================================
       9000-str-pd02200-grt section.
       
            start pd02200 key is greater f02200-chave
       
       exit.

      *>=================================================================================
       9000-str-pd02200-ngrt section.
       
            start pd02200 key is not greater f02200-chave
       
       exit.      
       
      *>=================================================================================
       9000-Read_Yomu-pd02200-ran section.
       
            read pd02200
       
       exit. 
        
       *>=================================================================================
       9000-Read_Yomu-pd02200-nex section.
       
            read pd02200 next
       
       exit. 
             
      *>=================================================================================
       9000-Read_Yomu-pd02200-pre section.
       
            read pd02200 previous
       
       exit.              
             
      *>=================================================================================
       9000-Write_Kaku-pd02200 section.
       
            write f02200-Parameters-nfe
           
       exit.
       
      *>=================================================================================
       9000-Rewrite_Kakinaosu-pd02200 section.
       
            rewrite f02200-Parameters-nfe
           
       exit.
     