      *>================================================================  
       9000-Open_Akeru-io-pd00100 section.
           
           string lnk-DataPath delimited   by "  " "\EFD001.DAT" into wid-pd00100
                                           
           open i-o pd00100
           if   not ws-OperationOK
                
                string "Error_Eraa de Opening_Kaishi File_Fairu EFD001.DAT - Status [" ws-AccessResult "]" into ws-Message_Messeji
                
                perform 9000-Message_Messeji
                perform 9000-Abort_Chushi

           end-if
           
       exit.
      
      *>================================================================
       9000-str-pd00100-grt section.
       
            start pd00100 key is greater f00100-chave
       
       exit.      
      
      *>================================================================
       9000-Read_Yomu-pd00100-ran section.
       
            read pd00100
       
       exit.

      *>================================================================
       9000-Read_Yomu-pd00100-ran-1 section.
       
            read pd00100 key f00100-chave-1
       
       exit.
              
      *>================================================================
       9000-Read_Yomu-pd00100-nex section.
       
            read pd00100 next
       
       exit.
       
      *>================================================================
       9000-Write_Kaku-pd00100 section.
       
            write f00100-Modules_Mojuru
           
       exit.
       
      *>================================================================
       9000-Rewrite_Kakinaosu-pd00100 section.
       
            rewrite f00100-Modules_Mojuru
           
       exit.