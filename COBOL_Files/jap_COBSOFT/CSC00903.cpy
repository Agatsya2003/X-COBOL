       8000-inicia-Frame_Furemu section.
       
            move 00                                 to wf-Frame_Furemu
            move 00                                 to wf-Option_Opushon
            
       exit. 
        
      *>=================================================================================
       8000-FrameControl section.
           
           move 09                                 to wf-Frame_Furemu
       
       exit.
      
      *>=================================================================================
       8000-accept-Option_Opushon section.

            move zeros                             to wf-Option_Opushon
            
            perform until wf-Option_Opushon <> zeros
                 accept wf-Option_Opushon at line 08 col 29 with update auto-skip 
            end-perform
       
       exit.
       

