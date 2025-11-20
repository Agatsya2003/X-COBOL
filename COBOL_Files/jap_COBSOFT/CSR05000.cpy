      *>================================================================================= 
       9000-Open_Akeru-i-pd05000 section.
           string lnk-DataPath delimited   by "  " "\EFD050.DAT" into wid-pd05000                             
                                           
           open input pd05000
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD050.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.
       
      *>================================================================================= 
       9000-Open_Akeru-o-pd05000 section.
           string lnk-DataPath delimited   by "  " "\EFD050.DAT" into wid-pd05000                             
                                           
           open output pd05000
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD050.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================================= 
       9000-Open_Akeru-io-pd05000 section.
           string lnk-DataPath delimited   by "  " "\EFD050.DAT" into wid-pd05000                             
                                           
           open i-o pd05000
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD050.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>=================================================================================
       9000-str-pd05000-grt section.
       
            start pd05000 key is greater f05000-chave
       
       exit.

      *>=================================================================================
       9000-str-pd05000-ngrt section.
       
            start pd05000 key is not greater f05000-chave
       
       exit.      
       
      *>=================================================================================
       9000-Read_Yomu-pd05000-ran section.
       
            read pd05000

       exit. 
        
       *>=================================================================================
       9000-Read_Yomu-pd05000-nex section.
       
            read pd05000 next
       
       exit. 
             
      *>=================================================================================
       9000-Read_Yomu-pd05000-pre section.
       
            read pd05000 previous
       
       exit.              
             
      *>=================================================================================
       9000-Write_Kaku-pd05000 section.
       
            write f05000-mestre-Invoice_Seikyusho
           
       exit.
       
      *>=================================================================================
       9000-Rewrite_Kakinaosu-pd05000 section.
       
            rewrite f05000-mestre-Invoice_Seikyusho
           
       exit.
     