       9000-mestre-Invoice_Seikyusho section.
        
            initialize                             f05000-mestre-Invoice_Seikyusho
            move wf05000-CompanyCode                to f05000-CompanyCode
            move wf05000-BranchCode                 to f05000-BranchCode
            move wf05000-Type-nota                 to f05000-Type-nota
            move wf05000-Number-documento          to f05000-Number-documento
            move wf05000-Series-documento           to f05000-Series-documento
            move wf05000-cd-destinatario           to f05000-cd-destinatario
            move wf05000-Seq                 to f05000-Seq
            move wf05000-data-operacao             to f05000-data-operacao
            move wf05000-horario-operacao          to f05000-horario-operacao
            move wf05000-UserID-operacao       to f05000-UserID-operacao
            move wf05000-data-Exit_Deguchi                to f05000-data-Exit_Deguchi
            move wf05000-horario-Exit_Deguchi             to f05000-horario-Exit_Deguchi
            move wf05000-data-entrega              to f05000-data-entrega
            move wf05000-horario-entrega           to f05000-horario-entrega
            move wf05000-base-icms                 to f05000-base-icms
            move wf05000-Value-icms                to f05000-Value-icms
            move wf05000-base-icms-st              to f05000-base-icms-st
            move wf05000-Value-icms-st             to f05000-Value-icms-st
            move wf05000-Value-importacao          to f05000-Value-importacao
            move wf05000-Value-pis                 to f05000-Value-pis
            move wf05000-Value-total-produtos      to f05000-Value-total-produtos
            move wf05000-Value-frete               to f05000-Value-frete
            move wf05000-Value-seguro              to f05000-Value-seguro
            move wf05000-Value-desconto            to f05000-Value-desconto
            move wf05000-Value-outras-despesas     to f05000-Value-outras-despesas
            move wf05000-Value-ipi                 to f05000-Value-ipi
            move wf05000-Value-cofins              to f05000-Value-cofins
            move wf05000-Value-total               to f05000-Value-total  

       exit.
       
              