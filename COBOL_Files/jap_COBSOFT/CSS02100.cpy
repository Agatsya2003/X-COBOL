           select pd02100 assign to disk wid-pd02100
                organization        is indexed
                access mode         is dynamic
                record key          is f02100-chave = 
                                       f02100-CompanyCode
                                       f02100-BranchCode
                                       f02100-ProductCode                                      
                lock mode           is manual
                file status         is ws-AccessResult.

      


