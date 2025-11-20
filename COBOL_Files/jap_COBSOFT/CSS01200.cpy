           select pd01200 assign to disk wid-pd01200
                organization        is indexed
                access mode         is dynamic
                record key          is f01200-chave = 
                                       f01200-CompanyCode                
                                       f01200-BranchCode
                                       f01200-UserID
                                       f01200-ProfileCode
                lock mode           is manual
                file status         is ws-AccessResult.
   
      


