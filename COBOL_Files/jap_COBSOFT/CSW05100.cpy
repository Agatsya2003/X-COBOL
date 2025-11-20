       01   wf05100-item-Invoice_Seikyusho.
            03 wf05100-chave.
               05 wf05100-CompanyCode               pic 9(03).
               05 wf05100-BranchCode                pic 9(04).
               05 wf05100-Type-nota                pic 9(02).
                  88 wf05100-nota-entrada              value 00.
                  88 wf05100-nota-Exit_Deguchi                value 01.
               05 wf05100-Number-documento         pic 9(09).
               05 wf05100-Series-documento          pic x(03).
               05 wf05100-cd-destinatario          pic 9(09).
               05 wf05100-Seq                pic 9(09).
            03 wf05100-cd-Merchandise_Shohin               pic 9(09).
            03 wf05100-cst                         pic 9(04).
            03 wf05100-cfop                        pic 9(04).
            03 wf05100-cd-unidade-medida           pic 9(09).
            03 wf05100-Qty-Merchandise_Shohin       pic 9(09)v9(06).
            03 wf05100-Value-unitario              pic 9(09)v9(06).
            03 wf05100-Value-total                 pic 9(09)v9(02).
            03 wf05100-base-icms                   pic 9(09)v9(02).
            03 wf05100-Value-icms                  pic 9(09)v9(02).
            03 wf05100-Value-ipi                   pic 9(09)v9(02).
            03 wf05100-aliq-icms                   pic 9(09)v9(02).
            03 wf05100-aliq-ipi                    pic 9(09)v9(02).
            03 filler                              pic x(91).
