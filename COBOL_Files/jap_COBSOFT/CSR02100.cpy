      *>================================================================================= 
       9000-Open_Akeru-i-pd02100 section.
           string lnk-DataPath delimited   by "  " "\EFD021.DAT" into wid-pd02100                             
                                           
           open input pd02100
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD021.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.
       
      *>================================================================================= 
       9000-Open_Akeru-o-pd02100 section.
           string lnk-DataPath delimited   by "  " "\EFD021.DAT" into wid-pd02100                             
                                           
           open output pd02100
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD021.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================================= 
       9000-Open_Akeru-io-pd02100 section.
           string lnk-DataPath delimited   by "  " "\EFD021.DAT" into wid-pd02100                             
                                           
           open i-o pd02100
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD021.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>=================================================================================
       9000-str-pd02100-grt section.
       
            start pd02100 key is greater f02100-chave
       
       exit.

      *>=================================================================================
       9000-str-pd02100-ngrt section.
       
            start pd02100 key is not greater f02100-chave
       
       exit.      
       
      *>=================================================================================
       9000-Read_Yomu-pd02100-ran section.
       
            read pd02100
       
       exit. 
        
       *>=================================================================================
       9000-Read_Yomu-pd02100-nex section.
       
            read pd02100 next
       
       exit. 
             
      *>=================================================================================
       9000-Read_Yomu-pd02100-pre section.
       
            read pd02100 previous
       
       exit.              
             
      *>=================================================================================
       9000-Write_Kaku-pd02100 section.
       
            write f02100-preco-Product_Seihin
           
       exit.
       
      *>=================================================================================
       9000-Rewrite_Kakinaosu-pd02100 section.
       
            rewrite f02100-preco-Product_Seihin
           
       exit.
     