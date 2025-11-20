      *>================================================================================= 
       9000-Open_Akeru-i-pd05100 section.
           string lnk-DataPath delimited   by "  " "\EFD051.DAT" into wid-pd05100                             
                                           
           open input pd05100
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD051.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.
       
      *>================================================================================= 
       9000-Open_Akeru-o-pd05100 section.
           string lnk-DataPath delimited   by "  " "\EFD051.DAT" into wid-pd05100                             
                                           
           open output pd05100
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD051.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================================= 
       9000-Open_Akeru-io-pd05100 section.
           string lnk-DataPath delimited   by "  " "\EFD051.DAT" into wid-pd05100                             
                                           
           open i-o pd05100
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD051.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>=================================================================================
       9000-str-pd05100-grt section.
       
            start pd05100 key is greater f05100-chave
       
       exit.

      *>=================================================================================
       9000-str-pd05100-ngrt section.
       
            start pd05100 key is not greater f05100-chave
       
       exit.      
       
      *>=================================================================================
       9000-Read_Yomu-pd05100-ran section.
       
            read pd05100

       exit. 
        
       *>=================================================================================
       9000-Read_Yomu-pd05100-nex section.
       
            read pd05100 next
       
       exit. 
             
      *>=================================================================================
       9000-Read_Yomu-pd05100-pre section.
       
            read pd05100 previous
       
       exit.              
             
      *>=================================================================================
       9000-Write_Kaku-pd05100 section.
       
            write f05100-item-Invoice_Seikyusho
           
       exit.
       
      *>=================================================================================
       9000-Rewrite_Kakinaosu-pd05100 section.
       
            rewrite f05100-item-Invoice_Seikyusho
           
       exit.
     