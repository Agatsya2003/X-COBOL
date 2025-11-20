           select pd06000 assign to disk wid-pd06000
                organization        is indexed
                access mode         is dynamic
                record key          is f06000-chave =
                                       f06000-CompanyCode
                                       f06000-BranchCode
                                       f06000-ProductCode                                      
                lock mode           is manual
                file status         is ws-AccessResult.
      


