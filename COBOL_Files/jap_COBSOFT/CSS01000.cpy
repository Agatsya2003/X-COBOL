           select pd01000 assign to disk wid-pd01000
                organization        is indexed
                access mode         is dynamic
                record key          is f01000-chave = 
                                       f01000-CompanyCode                
                                       f01000-BranchCode
                                       f01000-ProfileCode
                lock mode           is manual
                file status         is ws-AccessResult.
