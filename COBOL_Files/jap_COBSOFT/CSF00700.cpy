       fd   pd00700. 
      
       01   f00700-Company_Kaisha.
            03 f00700-CompanyCode                   pic 9(03).
            03 f00700-BranchCode                    pic 9(04).
            03 f00700-razao-social                 pic x(55).
            03 f00700-Name_Namae-fantasia                pic x(55).
            03 f00700-cnpj                         pic 9(14).
            03 f00700-ie                           pic x(11).
            03 f00700-id-Street_Jusho                pic 9(09).
            03 f00700-nr-Address_Jusho                  pic x(10).
            03 f00700-PhoneNum-1                pic 9(14).
            03 f00700-PhoneNum-2                pic 9(14).
            03 f00700-PhoneNum-3                pic 9(14).
            03 f00700-Email                        pic x(55).
            03 f00700-StatusID                    pic x(01).
               88 f00700-Company_Kaisha-ativa                 value "A".
               88 f00700-Company_Kaisha-inativa               value "I".
               88 f00700-Company_Kaisha-bloqueada             value "B".
      


