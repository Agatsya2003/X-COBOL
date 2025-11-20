      *>================================================================================= 
       9000-Open_Akeru-i-pd06000 section.
           string lnk-DataPath delimited   by "  " "\EFD060.DAT" into wid-pd06000                             
                                           
           open input pd06000
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD060.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.
       
      *>================================================================================= 
       9000-Open_Akeru-o-pd06000 section.
           string lnk-DataPath delimited   by "  " "\EFD060.DAT" into wid-pd06000                             
                                           
           open output pd06000
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD060.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>================================================================================= 
       9000-Open_Akeru-io-pd06000 section.
           string lnk-DataPath delimited   by "  " "\EFD060.DAT" into wid-pd06000                             
                                           
           open i-o pd06000
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD060.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.

      *>=================================================================================
       9000-str-pd06000-grt section.
       
            start pd06000 key is greater f06000-chave
       
       exit.

      *>=================================================================================
       9000-str-pd06000-ngrt section.
       
            start pd06000 key is not greater f06000-chave
       
       exit.      
       
      *>=================================================================================
       9000-Read_Yomu-pd06000-ran section.
       
            read pd06000

       exit. 
        
       *>=================================================================================
       9000-Read_Yomu-pd06000-nex section.
       
            read pd06000 next
       
       exit. 
             
      *>=================================================================================
       9000-Read_Yomu-pd06000-pre section.
       
            read pd06000 previous
       
       exit.              
             
      *>=================================================================================
       9000-Write_Kaku-pd06000 section.
       
            write f06000-Stock_Zaiko
           
       exit.
       
      *>=================================================================================
       9000-Rewrite_Kakinaosu-pd06000 section.
       
            rewrite f06000-Stock_Zaiko
           
       exit.
     