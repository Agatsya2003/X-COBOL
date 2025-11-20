      *>================================================================================= 
       9000-Open_Akeru-i-pd01800 section.
           string lnk-DataPath delimited   by "  " "\EFD018.DAT" into wid-pd01800                             
                                           
           open input pd01800
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD018.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.
       
      *>================================================================================= 
       9000-Open_Akeru-o-pd01800 section.
           string lnk-DataPath delimited   by "  " "\EFD018.DAT" into wid-pd01800                             
                                           
           open output pd01800
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD018.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================================= 
       9000-Open_Akeru-io-pd01800 section.
           string lnk-DataPath delimited   by "  " "\EFD018.DAT" into wid-pd01800                             
                                           
           open i-o pd01800
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD018.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>=================================================================================
       9000-str-pd01800-grt section.
       
            start pd01800 key is greater f01800-chave
       
       exit.

      *>=================================================================================
       9000-str-pd01800-ngrt section.
       
            start pd01800 key is not greater f01800-chave
       
       exit.      
       
      *>=================================================================================
       9000-Read_Yomu-pd01800-ran section.
       
            read pd01800
       
       exit. 
        
       *>=================================================================================
       9000-Read_Yomu-pd01800-nex section.
       
            read pd01800 next
       
       exit. 
             
      *>=================================================================================
       9000-Read_Yomu-pd01800-pre section.
       
            read pd01800 previous
       
       exit.              
             
      *>=================================================================================
       9000-Write_Kaku-pd01800 section.
       
            write f01800-Product_Seihin
           
       exit.
       
      *>=================================================================================
       9000-Rewrite_Kakinaosu-pd01800 section.
       
            rewrite f01800-Product_Seihin
           
       exit.
     