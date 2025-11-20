           select pd01100 assign to disk wid-pd01100
                organization        is indexed
                access mode         is dynamic
                record key          is f01100-chave = 
                                       f01100-CompanyCode                
                                       f01100-BranchCode
                                       f01100-ProfileCode
                                       f01100-ProgramCode
                lock mode           is manual
                file status         is ws-AccessResult.
