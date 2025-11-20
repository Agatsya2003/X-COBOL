           select pd01800 assign to disk wid-pd01800
                organization        is indexed
                access mode         is dynamic
                record key          is f01800-chave = 
                                       f01800-CompanyCode
                                       f01800-BranchCode
                                       f01800-ProductCode                                      
                lock mode           is manual
                file status         is ws-AccessResult.

      


