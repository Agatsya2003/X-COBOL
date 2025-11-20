           select pd00900 assign to disk wid-pd00900
                organization        is indexed
                access mode         is dynamic
                record key          is f00900-chave = 
                                       f00900-UserID
                                       f00900-CompanyCode
                                       f00900-BranchCode
                lock mode           is manual
                file status         is ws-AccessResult.
