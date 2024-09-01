Program Projet;
Uses crt;
Const 
    m = 200;
Var 
    CheckChargDonn : boolean;
    r,filierefiliere,initial ,filiereu,initiall,nomS,initialN : string;
    pgr,tp,log,total,note : real;
    i,y,x,j,choix,NombreStagiaire,ch,InscriptionN,fi,num,numS,counter,prochain,u,modification,
    choixNiveau,NumChek,choixSupp,checkCharge,NSsize,choixFiliere,choixAjouter,choixRecherche,choixChargement,CharegementSize,BNStagiaire,NumIns1: integer;
    NumIns : array[1..m] Of integer;
    NP,Filiere,Niveau,ObservationP,ObservationTP,ObservationL,Resultat : array[1..m] Of string;
    NoteProgrammation,NoteTP,NoteLogiciel,MG : array[1..m] Of real;


    //Partie 1 de projet programmation structuree :


Procedure Chargement;               // METHOD POUR CHARGER LES DONNEES DES STAGIAIRES
Begin
    clrscr;
    NSsize := 0;
    writeln('Chargement les donnees de stagiaire.');
    Repeat
    For i:=0 To  NombreStagiaire-1 Do
            Begin
            	
            	repeat
            	j:=0;
                write(' Entrer le numero d''inscription stagiaire: ');
                readln(NumIns1);
                
                for u:=0 to NombreStagiaire-1 do 
                begin
                	if NumIns1 = NumIns[u] then
                	begin
                		writeln('   Il y''a deja un stagiaire avec ce numero d''iscription veuillez entre un numero d''iscription different.');
                                writeln('  ----------------------------------------------');
                		j:=1;
                end;
            end;
            until j = 0;
          
            NumIns[i] := NumIns1;
                
            
          
                
            
            
                write(' Entrer le nom de stagiaire: ');
                readln(NP [i]);
                write(' Entrer la filier de stagiaire: ');
                readln(Filiere[i]);
                NSsize+= 1;              //  Nombre Stagiaire size 
                CheckChargDonn:=true;

                //      NIVEAU
                y := 0;
                Repeat

                    // WHEN IF GONNA WORK
                    If y > 0 Then
                        Begin
                            writeln(' Incorrect choix');
                            writeln('--------------------------------------');
                        End;
                    ////////////////////


                    writeln(' Choisissez le niveau du stagiaire entrer [ 1 Ou 2 ] ');
                    writeln('   1-1ere annee');
                    writeln('   2-2eme annee');
                    write(' Votre choix est: ');
                    readln(choixNiveau);

                    If choixNiveau = 1 Then
                        Begin
                            Niveau[i] := '1ere annee';
                        End;
                    If choixNiveau = 2 Then
                        Begin
                            Niveau[i] := '2eme annee';
                        End;
                    y+= 1;
                Until (choixNiveau = 1) Or (choixNiveau = 2);
                ////////////////////////////////////////// Repeat NIVEAU


                repeat
                If  NSsize < NombreStagiaire then                                // ILA KANT  ( NSsize < NombreStagiaire ) GHADI ITAL3 DAKCHI LI DAKH IF 
                    Begin
                    
                        writeln('Entrer [ 1 ] pour continue la charge.');
                        writeln('Entrer [ 2 ] pour quitter.');
                        readln(checkCharge);

                        If checkCharge = 2 then                             //ILA KANT ( checkCharge = 2 ) GHADI TKHRAJ MN FOR LOOP
                            Begin
                                i := NombreStagiaire;
                            End;
                    End
                else                                       //   HAD ELSE DYAL  ( if  NSsize < NombreStagiaire then ) YA3NI ILA KAN L3AKS DYAL IF 3AD GHADI TKHDM
                    Begin
                        i := NombreStagiaire;
                        checkCharge := 2;
                    End;
                 until (checkCharge = 1 ) or ( checkCharge = 2 );

            End;
    Until checkCharge = 2;
    NombreStagiaire := NSsize;                           // KATHADD SIZE DYAL NOMBRE STAGAIRE 3LA HSSAB CH7AL DAKHLTI DYAL LES STAGIAIRE
End;





 // METHOD POUR TRIER LES DONNEES DES STAGIAIRE A PARTIR DE NUMERO D'INSCRIPTION
Procedure trierNumIns;                                       
Begin
    For i:=0 To NombreStagiaire-1 Do
        Begin
            For y:=i+1 To NombreStagiaire-1 Do
                Begin
                    If NumIns[i] > NumIns[y] Then
                        Begin
                            x := NumIns[y];
                            NumIns[y] := NumIns[i];
                            NumIns[i] := x;

                            r := NP[i];
                            NP[i] := NP[y];
                            NP[y] := r;

                            r := Filiere[i];
                            Filiere[i] := Filiere[y];
                            Filiere[y] := r;

                            r := Niveau[i];
                            Niveau[i] := Niveau[y];
                            Niveau[y] := r;
                        End;
                End;
        End;
End;



// METHOD POUR TRIER LES DONNEES DES STAGIAIRE A PARTIR DE NOM
Procedure TrierNP;

Begin
    For i:=0 To NombreStagiaire-1 Do

        For y:=i+1 To NombreStagiaire-1 Do
            Begin
                If NP[i]>
                   NP[y]  Then
                    Begin
                        r := NP[i];
                        NP[i] := NP[y];
                        NP[y] := r;

                        x := NumIns[y];
                        NumIns[y] := NumIns[i];
                        NumIns[i] := x;

                        r := Filiere[i];
                        Filiere[i] := Filiere[y];
                        Filiere[y] := r;

                        r := Niveau[i];
                        Niveau[i] := Niveau[y];
                        Niveau[y] := r;

                    End;
            End;
End;


// UN METHOD QUI AFFICHE TOUTE LES DONNES DES STAGIAIRES
Procedure AfficherEtatglobale;

Begin
    clrscr;
    writeln('----------------------------------------------------------------------------------------------------');
    writeln('|','Groupe IPIRNET':16,'|':84);
    writeln('|','Berrechid':13,'|':87);
    writeln('|','LISTE DES STAGIAIRES GLOBALE':64,'|':36);
    writeln('|','|':100);
    writeln('|','|':100);
    writeln('|','Annee : 2022 / 2023':78,'|':22);
    writeln('|','|':100);
    writeln('|','--------------------------------------------------------------------------':87,'|':13);
    writeln('|','|  Num Ins  |      Nom et prenom      |     Filere     |      Niveau      |':87,'|':13);
    For i:=0 To NombreStagiaire-1 Do
        Begin
            writeln('|','--------------------------------------------------------------------------':87,'|':13);
            writeln('|','            |  ',NumIns[i]:6,'   |  ',NP[i]:20,'   |   ',Filiere[i]:10,'   | ',Niveau[i]:15,'  |','|':13 );
        End;
    writeln('|','--------------------------------------------------------------------------':87,'|':
            13);
    writeln('----------------------------------------------------------------------------------------------------');
    writeln('   Click enter pour continue.');
    readln;
    //writeln('nombre Stagiaire= ',NombreStagiaire);
    //writeln(' numero inscri 0= ',NumIns[0]);
    // writeln(' numero inscri 1= ',NumIns[1]);
End;




// UN METHOD QUI AFFICHE TOUTE LES DONNES DES STAGIAIRES A PARTIR DE LA FILIERE QUI  VA  ENTRER 
Procedure AfficherEtatFiliere;

Begin
    clrscr;
    Repeat

        write('   Vous voulez afficher l''etat de quelle filiere: ');
        readln(filierefiliere);
        y := 0;
        For fi:=0 To NombreStagiaire Do
            Begin
                If filierefiliere = Filiere[fi] Then
                    Begin
                        initial := Filiere[fi];
                        y := 1;
                    End;
            End;


        If y = 0 Then
            //ILA MAKANTCH FILIERE LI DAKHL USER KAYNA 3AND CHI STAGIAIRE GHADI TKHDM HAD  IF  IF
            Begin
                writeln('    Aucun Filiere avec ce nom.');
                writeln('------------------------------------------');
                writeln('Entrer 1 pour entrer une novel filiere.');
                writeln('Entrer 2 pour quitter.');
                readln(choixFiliere);
                If choixFiliere = 2 Then
                    Begin
                        y := 2;
                    End;
            End;


    Until (y = 1) Or (y = 2);
    If y = 1 Then
        // YA3NI ILA KANT FILIERE 3AND CHI STAGIAIRE  3AD GHADI TKHDM HAD IF 
        Begin
            writeln(
'----------------------------------------------------------------------------------------------------'
            );
            writeln('|','Groupe IPIRNET':16,'|':84);
            writeln('|','Berrechid':13,'|':87);
            writeln('|','LISTE DES STAGIAIRES GLOBALE':64,'|':36);
            writeln('|','|':100);
            writeln('|','|':100);
            //write('|','Niveau        : ':26,initialN:20);
            //writeln('':10,'Annee   : 2022 / 2023':30,'|':14);
            write('|','Filier : ':15,initial:12);
            writeln('':10,'Annee : 2022 / 2023':40,'|':23);
            writeln('|','|':100);
            writeln('|','--------------------------------------------------------------------------'
                    :87,'|':
                    13);
            writeln('|',
                    '|  Num Ins  |      Nom et prenom      |     Filere     |      Niveau      |':87
                    ,'|'
                    :13);
            For fi:=0 To NombreStagiaire Do
                If filierefiliere = Filiere[fi] Then
                    Begin
                        writeln('|',

                        '--------------------------------------------------------------------------'
                                :87,'|':13);
                        writeln('|','            |  ',NumIns[fi]:6,'   |  ',NP[fi]:20,'   |   ',
                                Filiere[fi]:
                                10,'   | ',Niveau[fi]:15,'  |','|':13 );
                    End;
            writeln('|','--------------------------------------------------------------------------'
                    :87,'|':
                    13);
            writeln(
'----------------------------------------------------------------------------------------------------'
            );
            writeln('   Click enter pour continue.');
            readln;
        End;
End;








//Partie 2  de projet programmation structuree :

Procedure AjouterStagiaire;                               //METHOD POUR AJOUTER DES STAGIAIRE 
Begin    
	for i:= NombreStagiaire to NombreStagiaire do
        writeln('   Pour ajouter un stagiaire veuillez entrer ses donnees.');
    j := 0;
    x := 1;
    Repeat

        If j = 1 Then
            Begin
            	repeat
            	if j = 10 then
            	begin
            	writeln('Incorrect choix entrer un nombre entre 1 et 2.');
            	writeln('-------------------------------------------');
            	end;
                writeln('   Entrer [ 1 ] pour essayer un noveau numero d''inscription.');
                writeln('   Entrer [ 2 ] pour quitter.');
                readln(choixAjouter);
                If choixAjouter = 1 Then
                    Begin
                        x := 1;
                    End;
                If choixAjouter = 2 Then
                    Begin
                        x := 0;
                    End;
            j :=10;
    until (choixAjouter = 1 ) or ( choixAjouter = 2);
End;

 j := 0;
        If x = 1 Then
            Begin
                write(' Entrer le numero d''inscription stagiaire: ');                  // KADKHL NUM INSCRIPTION ILA MAKAN HTA STAGIAIRE  3ANDO NAFS NUM GHADI  TKML TDKHAL LES DONNEES 3ADI 
                readln(NumChek);                                                                        //  ILA KAN DEJA CHI WAHD 3ANDO NAFS NUM LI DAKHLTI GHADI ITL3 LK MESSAGE
                For u:=0 To NombreStagiaire Do
                    Begin
                        If NumChek = NumIns[u] Then
                            Begin
                                writeln(' Il y''a deja un stagiaire avec ce numero d''iscription.');
                                writeln('-------------------------------------------');
                                j := 1;
                      
                            end
                    End;
            End;

    Until  ( x = 0) or ( j = 0);


 
 if x <> 0 then
 begin
            NumIns[i] := NumChek;
            NombreStagiaire := NombreStagiaire+1;
            write(' Entrer le nom de stagiaire: ');
            readln(NP [i]);
            write(' Entrer la filier de stagiaire: ');
            readln(Filiere[i]);

            y := 0;
            Repeat
                If y > 0 Then
                    Begin
                        writeln('Incorrect choix entrer un nombre entre 1 et 2.');
                        writeln(' --------------------------');
                    End;
                writeln(' Choisissez le niveau du stagiaire entrer [ 1 Ou 2 ] ');
                writeln('1-1ere annee');
                writeln('2-2eme annee');
                readln(choix);
                If choix = 1 Then
                    Begin
                        Niveau[i] := '1ere annee';
                    End;
                If choix = 2 Then
                    Begin
                        Niveau[i] := '2eme annee';
                    End;
                y+= 1;
            Until (choix = 1) Or (choix = 2);
end;
End;






Procedure RechercheStagiaire;               //METHOD KADIR LA RECHRCHE 3LA LES STAGAIRES A PARTIR DE NUMERO D'INSCRIPTION
Begin
    clrscr;
 x := 0;
 j :=0;
    Repeat
//////////////////////////////////
       
            	writeln('  Aucun stagiaire avec ce numero');
            	writeln('---------------------------------------------');
             If x = 1 Then
            Begin
            	repeat
            	if j = 10 then
            	begin
                writeln('Incorrect choix entrer un nombre entre 1 et 2.');
                	writeln('---------------------------------------------');
            end;
            
                writeln('   Entrer [ 1 ] pour entrer un nouveau numero.');
                writeln('   Entrer [ 2 ] pour quitter.');
                write('   Votre choix est: ');
                readln(choixRecherche);
                if choixRecherche = 1 then
                begin
                	x:=0;
            end;
            if choixRecherche = 2 then
            begin
            	x:=10;
            end;
            j:=10;
            until (choixRecherche = 1) or (choixRecherche = 2) ;
    End;
    ///////////////////////////////////
  
    if x= 0 then
    begin
        write('   Entrer le Numero d''inscription de stagiaire souhaitez vous le rechercher: ');
        readln(InscriptionN);
        For i:=0 To NombreStagiaire-1 Do
            Begin
                If InscriptionN = NumIns[i] Then
                    Begin
                    	x:=10;
                        writeln(' -----------------------------------------------------------------');
                        writeln('| Num Ins |      Nom et prenom      |  Filere   |     Niveau      |');
                        writeln(' -----------------------------------------------------------------');
                        writeln('| ',NumIns[i]:7,' |  ',NP[i]:21,'  | ',Filiere[i]:9,' | ',Niveau[i]:11,'     |');
                        writeln(' -----------------------------------------------------------------');
                    End
                    else
                    begin
                    	x := 1;
                    	 j :=0;
                end; 
                End;
                end;
    Until (x=10);
End;




Procedure ModifierStagiaire;
Begin
    clrscr;
    Repeat
        y := 0;
        writeln('   Entrer le Numero d''inscription de stagiaire souhaitez vous le modifier : ');
        readln(InscriptionN);
        For i:=0 To NombreStagiaire Do
            Begin
                If InscriptionN = NumIns[i] Then
                    Begin
                        modification := 1;
                        y := 1;
                        write('Entrer le noveau nom de stagiaire: ');
                        readln(NP [i]);
                        write('Entrer la novel filier de stagiaire: ');
                        readln(Filiere[i]);
                        Repeat
                            writeln(' Choisissez le niveau du stagiaire entrer [ 1 Ou 2 ] ');
                            writeln('1-1ere annee');
                            writeln('2-2eme annee');
                            readln(choix);
                            If choix = 1 Then
                                Begin
                                    Niveau[i] := '1ere annee';
                                End;
                            If choix = 2 Then
                                Begin
                                    Niveau[i] := '2eme annee';
                                End;
                        Until (choix = 1) Or (choix = 2);
                    End;
            End;
        If y = 0 Then
            Begin
                x := 0;
                Repeat
                    writeln('----------------------------------------------');
                    If x = 0 Then
                        Begin
                            writeln('Incorrect Numero d''inscription.');
                        End;
                    If x = 1 Then
                        Begin
                            writeln('Incorrect choix entrer un nombre entre 1 et 2.');
                        End;
                    writeln('Entrer [ 1 ] pour entrer un nouveau numero d''iscription.');
                    writeln('Entrer [ 2 ] pour quitter.');
                    readln(ch);
                    If ch = 2 Then
                        Begin
                            y := 1;
                        End;
                    x := 1;
                Until (ch = 1) Or (ch = 2);
            End;
    Until (y=1);
End;




Procedure SuppUnStagiaire;
Begin
    y := 0;
    Repeat
        write(' Entrer le Numero d''inscription de stagiaire souhaitez vous le supprimer: ');
        readln(InscriptionN);
        For i:=0 To NombreStagiaire Do
            Begin
                If InscriptionN = NumIns[i] Then
                    Begin
                        modification := 1;
                        y := 1;
                        x := NumIns[i+1];
                        NumIns[i+1] := NumIns[i];
                        NumIns[i] := x;

                        r := NP[i+1];
                        NP[i+1] := NP[i];
                        NP[i] := r;

                        r := Filiere[i+1];
                        Filiere[i+1] := Filiere[i];
                        Filiere[i] := r;

                        r := Niveau[i+1];
                        Niveau[i+1] := Niveau[i];
                        Niveau[i] := r;
                        
                        note := NoteProgrammation[i+1];
                        NoteProgrammation[i+1] :=NoteProgrammation[i];
                        NoteProgrammation[i] := note;
                        
                          note := NoteTP[i+1];
                        NoteTP[i+1] :=NoteTP[i];
                        NoteTP[i] := note;
                        
                          note := NoteLogiciel[i+1];
                        NoteLogiciel[i+1] :=NoteLogiciel[i];
                        NoteLogiciel[i] := note;
                        
                        
                        
                    End;
            End;
        If y = 0 Then
            Begin
                writeln(' Aucun stagiaire avec ce numero d''inscription.');
                writeln('--------------------------------------------------------------------');
                Repeat
                    writeln('   Entrer [ 1 ] pour entrer un nouveau numero d''inscription.');
                    writeln('   Entrer [ 2 ] pour quitter.');
                    write('votre choix est: ');
                    readln(choixSupp);

                    If choixSupp = 2 Then
                        Begin
                            y := 2;
                        End;
                    If (choixSupp < 1) Or (choixSupp > 2) Then
                        Begin
                          writeln('Incorrect choix entrer un nombre entre 1 et 2.');
                          writeln('--------------------------------------------------------------------');
                        End;
                Until (choixSupp = 1) Or (choixSupp = 2);
            End;
        If  (NombreStagiaire > 0) And (y = 1) Then
            Begin
                NombreStagiaire := NombreStagiaire-1;
            End;
    Until (y=1) Or (y = 2);
    //AfficherEtatglobale;
End;





Procedure SuppToutes;
Begin
    For i:=0 To NombreStagiaire Do
        Begin
            NumIns[i] := 0;
            NP[i] := '';
            Filiere[i] := '';
            Niveau[i] := '';
        End;
    NombreStagiaire := 0;
    AfficherEtatglobale;
End;






//Partie 3 de projet programmation structuree :


// Method pour la validation des resultat.
Procedure AfficherResultat;
Begin
    For i:=0 To NombreStagiaire Do
        Begin
            If (Niveau[i]='1ere annee') And (MG[i] >= 10) Then
                Begin
                    Resultat[i] := '2eme Ann R';
                End;
            If (Niveau[i]='1ere annee') And (MG[i] < 10) Then
                Begin
                    Resultat[i] := '1ere Ann D';
                End;
            If (Niveau[i]='2eme annee') And (MG[i] >= 10) Then
                Begin
                    Resultat[i] := 'Laureat';
                End;
            If (Niveau[i]='2eme annee') And (MG[i] < 10) Then
                Begin
                    Resultat[i] := '2eme Ann D';
                End;
        End;
End;


//METHOD POUR AFFICHE L'OBSERVATION SUR LES BULLETINS
Procedure AfficherObservation;
Begin
    For i:=0 To NombreStagiaire Do
        Begin
            If NoteProgrammation[i] < 10 Then
                ObservationP[i] := 'Faible';
            If (NoteProgrammation[i] >= 10) And (NoteProgrammation[i] < 12) Then
                ObservationP[i] := 'Passable';
            If (NoteProgrammation[i] >= 12) And( NoteProgrammation[i] < 14) Then
                ObservationP[i] := 'A-Bien';
            If (NoteProgrammation[i] >=14) And (NoteProgrammation[i] < 16) Then
                ObservationP[i] := 'Bien';
            If (NoteProgrammation[i] >=16) And (NoteProgrammation[i] < 18) Then
                ObservationP[i] := 'T-Bien';
            If (NoteProgrammation[i] >=18) And (NoteProgrammation[i] <= 20) Then
                ObservationP[i] := 'Excelent';

            If NoteTP[i] < 10 Then
                ObservationTP[i] := 'Faible';
            If (NoteTP[i] >= 10) And (NoteTP[i] < 12) Then
                ObservationTP[i] := 'Passable';
            If (NoteTP[i] >= 12) And( NoteTP[i] < 14) Then
                ObservationTP[i] := 'A-Bien';
            If (NoteTP[i] >=14) And (NoteTP[i] < 16) Then
                ObservationTP[i] := 'Bien';
            If (NoteTP[i] >=16) And (NoteTP[i] < 18) Then
                ObservationTP[i] := 'T-Bien';
            If (NoteTP[i] >=18) And (NoteTP[i] <= 20) Then
                ObservationTP[i] := 'Excelent';

            If NoteLogiciel[i] < 10 Then
                ObservationL[i] := 'Faible';
            If (NoteLogiciel[i] >= 10) And (NoteLogiciel[i] < 12) Then
                ObservationL[i] := 'Passable';
            If (NoteLogiciel[i] >= 12) And( NoteLogiciel[i] < 14) Then
                ObservationL[i] := 'A-Bien';
            If (NoteLogiciel[i] >=14) And (NoteLogiciel[i] < 16) Then
                ObservationL[i] := 'Bien';
            If (NoteLogiciel[i] >=16) And (NoteLogiciel[i] < 18) Then
                ObservationL[i] := 'T-Bien';
            If (NoteLogiciel[i] >=18) And (NoteLogiciel[i] <= 20) Then
                ObservationL[i] := 'Excelent';
        End;
End;




procedure user;  //METHOD KHADMTHA WST LMETHOD DYAL CHARGEMENT NOTE 
begin
	if  CharegementSize <  NombreStagiaire then
	begin
	        repeat
	        if   j = 10 then
	        begin
	        	writeln('   Incorrect choix entrer un nombre entre 1 et 2.');
	        	writeln('--------------------------------------------------------------------');
	        	end;
	        
                    writeln('   Entrer [ 1 ] pour charger les notes pour un autre stagiaire.');
                    writeln('   Entrer [ 2 ] pour quitter.');
                    write('  Votre choix est: ');
                    readln(choixChargement);
                    if choixChargement = 1 then
                    begin
                    	x:=0;
                end;
                if choixChargement = 2 then
                begin
                	x:=1;
                end;
                j := 10;
                until (choixChargement = 1) or (choixChargement = 2 );
	end;
end;






Procedure ChargementNote;               // METHOD KAT3TK BACH DAKHL NO9AT DYAL STAGIAIRE L KONTI DEJA MDAKHL LES DONNEES DYALHOM
Begin
	
	j := 0;
	CharegementSize := 0;
	
	repeat
    write(' Entrer le numero d''inscription de stagiaire: ');
    readln(numS);
    For i:=0 To NombreStagiaire Do
        Begin
        	
            If numS = NumIns[i] Then
                Begin
                	j:=1;
                	CharegementSize+=1;
                    Repeat
                        write(' Entrer la note de Programmation: ');
                        readln(NoteProgrammation[i]);
                        writeln('   --------------------------------------------');
                        y := 0;
                        
                        If (NoteProgrammation[i] < 0)Or (NoteProgrammation[i] >20) Then
                            Begin
                                writeln('   La moyenne doit etre un nombre de 0 a 20.');
                                y := 1;
                            End;
                    Until y=0;
                    
                    Repeat
                        write(' Entrer la note de TP: ');
                        readln(NoteTP[i]);
                        writeln('  --------------------------------------------');
                        y := 0;
                        
                        If (NoteTP[i] < 0)Or (NoteTP[i] >20) Then
                            Begin
                                writeln('   La moyenne doit etre un nombre de 0 a 20.');
                                y := 1;
                            End;
                    Until y=0;

                    Repeat
                        write(' Entrer la note de Logiciel: ');
                        readln(NoteLogiciel[i]);
                        writeln('   --------------------------------------------');
                        y := 0;
                        
                        If (NoteLogiciel[i] < 0)Or (NoteLogiciel[i] >20) Then
                            Begin
                                writeln('   La moyenne doit etre un nombre de 0 a 20.');
                                y := 1;
                            End;
                    Until y=0;

                    MG[i] := ((NoteProgrammation[i]*5) + (NoteTP[i] *5) +(NoteLogiciel[i] *3))/13;

                    // Method pour la validation des resultat.
                    AfficherResultat;
                    // Method pour la Observation des bulletins.
                    AfficherObservation;
                    // METHOD DE CHOIX ILA MAKANTCH NUM INSCRIPTION KAYN  KAT3TK DES OPTIONS
                    user;
           
        End
               else
                begin
                    j := 0;
                end;
            End;
          
            if j = 0 then
            begin
            	writeln('   Aucun stagiaire avec ce numero d''inscription.');
            	writeln('----------------------------------------------------------------');
            	user;
        end;
        
            until (x = 1) or (CharegementSize = NombreStagiaire);
End;






Procedure AffiNoteGlobale;    // UN METHOD QUI AFFICHE LES NOTE GLOBALE DES STAGIAIRES 
Begin
	clrscr;
    writeln(' -----------------------------------------------------------------------------------------------------------------------------------');
    writeln('|  Num Ins  |      Nom et prenom      |     Filere     |      Niveau      |  Programmation   |        TP        |     Logiciel     |');
    For i:=0 To NombreStagiaire-1 Do
        Begin
            writeln(' -----------------------------------------------------------------------------------------------------------------------------------');
            writeln('|  ',NumIns[i]:6,'   |  ',NP[i]:20,'   |   ',Filiere[i]:10,'   | ',Niveau[i]:15,'  |      ',NoteProgrammation[i]:5:2,'       |      ',NoteTP[i]:5:2,'       |      ',NoteLogiciel[i]:5:2,'       |');
        End;
    writeln(' -----------------------------------------------------------------------------------------------------------------------------------');
     writeln('Click entrer pour continuer.');
    readln;
    clrscr;
End;






Procedure AffiNoteParticulier;   // UN METHOD QUI AFFICHE UNE BULLETIN DE PARTICULIER KAT3TIHA NUM INSCRIPTION  O KAT3TK BULLETIN DYAL STAGIAIRE
Begin
	j := 0;
	repeat
    write(' Entrer le Numero d''inscription de Stagiaire pour afficher leur bulletin: ');
    readln(num);
    For i:=0 To NombreStagiaire Do
        Begin
            If num = NumIns[i] Then
                Begin
                	 j := 1;
                    nomS := NP[i];
                    initiall := Filiere[i];
                    initialN := Niveau[i];
                End;
            End;
            if j = 1 then
            begin
    writeln('----------------------------------------------------------------------------------------------------');
    writeln('|','Groupe IPIRNET':16,'|':84);
    writeln('|','Berrechid':13,'|':87);
    writeln('|','LISTE DES STAGIAIRES GLOBALE':64,'|':36);
    writeln('|','|':100);
    writeln('|','|':100);
    write('|','Nom et prenom : ':26,nomS:20);
    writeln('':10,'Filiere : ':19,initiall:11,'|':14);
    write('|','Niveau        : ':26,initialN:20);
    writeln('':10,'Annee   : 2022 / 2023':30,'|':14);
    writeln('|','|':100);
    writeln('|', '----------------------------------------------------------------------------------------':94,'|':6);
    writeln('| ', '|       Module       |      Note      |   Coef    |    Note*Coef     |   Observation   |':93,'|':6);
 
    For fi:=0 To NombreStagiaire-1 Do
        Begin
            If num = NumIns[fi] Then
                Begin
                
                    pgr := NoteProgrammation[fi]*5;
                    tp := NoteTP[fi]*5;
                    log := (NoteLogiciel[fi]*3);
                    total := pgr+tp+log;
                    writeln('|','----------------------------------------------------------------------------------------':94,'|':6);
                    writeln('|','      | ','Programmation TH':6,'   |     ',NoteProgrammation[fi]:5:2,'      |     ',5,'     |      ',pgr:6:2,'      |    ':9,ObservationP[ fi]:8,'     |','|':6);
                    writeln('|','----------------------------------------------------------------------------------------':94,'|':6);
                    writeln('|','      | ','Programmation TP':6,'   |     ',NoteTP[fi]:5:2,'      |     ',5,'     |      ',tp:6:2,'      |    ':9,ObservationTP[fi] :8,'     |','|':6);
                    writeln('|','----------------------------------------------------------------------------------------':94,'|':6);
                    writeln('|','      | ','Logiciel':6,'           |     ',NoteLogiciel[fi]:5:2,'      |     ',3,'     |      ',log:6:2,'      |    ':9,ObservationL[fi]:8,'     |','|':6);
                    writeln('|','----------------------------------------------------------------------------------------':94,'|':6);
                    writeln('|','                           |  ','Total         ','|    ',13,'     |     ',total:6:2,'|':8,'|':24 );
                    writeln('|','                           -------------------------------------------------','|':24);
                    writeln('|','                           |      ','Moyenne Generale    ','  |     ',MG[fi]:6:2,'|':8,'|':24 );
                    writeln('|','                           -------------------------------------------------','|':24);
                    writeln('|','                           |         ','Resultat         ','  |    ',Resultat[fi]:10,'   |':5,'|':24);
                    writeln('|','                           -------------------------------------------------','|':24);
                j:=10;
end;
            
        End;
End;
	x := 0;
if j = 0 then
begin
	writeln('Aucun stagiaire avec ce numero d''inscription.');

repeat
if x = 1 then
    writeln('Incorrect choix.');
	writeln('Entrer [ 1 ] pour essayer un noveau numero d''inscription.');
	writeln('Entree [ 2 ] pour quitter.');
	readln(BNStagiaire);
	if BNStagiaire = 1 then
	begin
end;
if BNStagiaire = 2 then
begin
	j := 10;
end;
x := 1;
until (BNStagiaire = 1 ) or (BNStagiaire = 2);
end;

until j = 10;
    writeln('----------------------------------------------------------------------------------------------------');
    writeln('Click entrer pour continuer.');
    readln;
    clrscr;
End;






Procedure AffiBNChaqueStagiaire;       // UNE METHOD POUR AFFICHER TOUTE LES BULLETINES DES NOTES DES STAGIAIRES 
Begin
    For fi:=0 To NombreStagiaire-1 Do
        Begin
            nomS := NP[fi];
            initiall := Filiere[fi];
            initialN := Niveau[fi];
            writeln('');
            writeln('');
            writeln('----------------------------------------------------------------------------------------------------');
            writeln('|','Groupe IPIRNET':16,'|':84);
            writeln('|','Berrechid':13,'|':87);
            writeln('|','LISTE DES STAGIAIRES GLOBALE':64,'|':36);
            writeln('|','|':100);
            writeln('|','|':100);
            write('|','Nom et prenom : ':26,nomS:20);
            writeln('':10,'Filiere : ':19,initiall:11,'|':14);
            write('|','Niveau        : ':26,initialN:20);
            writeln('':10,'Annee   : 2022 / 2023':30,'|':14);
            writeln('|','|':100);
            writeln('|','----------------------------------------------------------------------------------------':94,'|':6);
            writeln('| ','|       Module       |      Note      |   Coef    |    Note*Coef     |   Observation   |':93,'|':6);
            pgr := NoteProgrammation[fi]*5;
            tp := NoteTP[fi]*5;
            log := (NoteLogiciel[fi]*3);
            total := pgr+tp+log;
            writeln('|','----------------------------------------------------------------------------------------':94,'|':6);
            writeln('|','      | ','Programmation TH':6,'   |     ',NoteProgrammation[fi]:5:2,'      |     ',5,'     |      ',pgr:6:2,'      |    ':9,ObservationP[fi]:8,'     |','|':6);
            writeln('|','----------------------------------------------------------------------------------------':94,'|':6);
            writeln('|','      | ','Programmation TP':6,'   |     ',NoteTP[fi]:5:2,'      |     ',5,'     |      ',tp:6:2,'      |    ':9,ObservationTP[fi]:8,'     |','|':6);
            writeln('|','----------------------------------------------------------------------------------------':94,'|':6);
            writeln('|','      | ','Logiciel':6,'           |     ',NoteLogiciel[fi]:5:2, '      |     ',3,'     |      ',log:6:2,'      |    ':9,ObservationL[fi]:8,'     |','|':6);
            writeln('|','----------------------------------------------------------------------------------------':94,'|':6);
            writeln('|','                           |  ','Total         ','|    ',13,'     |     ',total:6:2,'|':8,'|':24 );
            writeln('|','                           -------------------------------------------------','|':24);
            writeln('|','                           |      ','Moyenne Generale    ','  |     ',MG[fi]:6:2,'|':8,'|':24 );
            writeln('|','                           -------------------------------------------------','|':24);
            writeln('|','                           |         ','Resultat         ','  |    ',Resultat[fi]:10,'   |':5,'|':24);
            writeln('|','                           -------------------------------------------------','|':24);
            writeln('----------------------------------------------------------------------------------------------------');

            counter+= 1;

            If fi < NombreStagiaire-1 Then
                Begin
                    Repeat
                        writeln('Entrer un nombre entre 1 et 2.');
                        writeln(' Volez vous afficher le bulletin du prochain stagiaire: ');
                        writeln('   1-Oui. ');
                        writeln('   2-Non. ');
                        write('Votre choix est: ');
                        readln(prochain);
                        If prochain = 2 Then
                            Begin
                                writeln('Au revoir');
                                fi+= (NombreStagiaire+2);
                            End;
                        If (prochain < 1) Or (prochain > 2) Then
                            Begin
                                writeln('Incorrect choix.');
                            End;
                        writeln('---------------------------------------------');
                    Until (prochain = 1) Or (prochain = 2);
                End;

        End;
    If counter = NombreStagiaire Then
        writeln('Il n''y a plus des stagiaires pour montrer son bulletins.');
    writeln('Click entrer pour continuer.');
    readln;

End;











//main method
Begin
    write(' Entrer le nombre des stagiaire: ');
    readln(NombreStagiaire);
    Repeat
        writeln(' --------------------------------------------------------------');
        writeln(' |                       Menu de choix                        |');
        writeln(' |                                                            |' );
        writeln(' | Entrer un nombre entre 1 et 15.                            |');
        writeln(' |   Entrer un choix:                                         |');
         writeln(' |                                                            |' );
        writeln(' |       1-Chargement des donnees de stagiaire.               |');
        writeln(' |       2-Trier les donnees sur le numero d''iscription.      |');
        writeln(' |       3-Trier les donnees sur le Nom et prenom.            |');
        writeln(' |       4-Afficher l''etat global.                            |');
        writeln(' |       5-Afficher l''etat par filiere                        |');
        writeln(' |       6-Ajouter un stagiaire.                              |');
        writeln(' |       7-Recherche un stagiaire.                            |');
        writeln(' |       8-Modifier les donnees d''un stagiaire.               |');
        writeln(' |       9-Supprimer un stagiaire.                            |');
        writeln(' |       10-Supprimer Toutes les donnees des stagiaires.      |');
        writeln(' |       11-Chargement des Note d''un stagiaire                |');
        writeln(' |       12-Afficher les note globale                         |');
        writeln(' |       13-Bulletin de note d''un stagiaire particulier.      |');
        writeln(' |       14-Bulletin de note de chaque Stagiaire.             |');
        writeln(' |       15-Quitter le programme.                             |');
        writeln(' --------------------------------------------------------------');
        write(' Votre choix est: ');
        readln(choix);

        If choix = 1 Then
            Begin
                Chargement;
            End;
        If choix = 2 Then
            Begin
            	if CheckChargDonn = true then
            	begin
                TrierNumIns;
                writeln('Le triage a ete complete avec succes.');
                write('Click entrer pour continuer.');
                readln;
            end
            else
            begin
            	writeln(' * Veuillez remplir les donnees des stagiaires d''abord via le premier choix dans le menu de choix.');
            	writeln('   ----------------------------------------------------------------------------');
        end;
        
            End;
        If choix = 3 Then
            Begin
            	if CheckChargDonn = true then
            	begin
                TrierNP;
                writeln('Le triage a ete complete avec succes.');
                write('Click entrer pour continuer.');
                readln;
                end
            else
            begin
            	 	writeln(' * Veuillez remplir les donnees des stagiaires d''abord via le premier choix dans le menu de choix.');
            	writeln('   ----------------------------------------------------------------------------');
        end;
            End;
        If choix = 4 Then
            Begin
            	if CheckChargDonn = true then
            	begin
                AfficherEtatglobale;
                end
            else
            begin
            	 	writeln(' * Veuillez remplir les donnees des stagiaires d''abord via le premier choix dans le menu de choix.');
            	writeln('   ----------------------------------------------------------------------------');
        end;
            End;
        If choix = 5 Then
            Begin
            	if CheckChargDonn = true then
            	begin
                AfficherEtatFiliere;
                end
            else
            begin
            	 	writeln(' * Veuillez remplir les donnees des stagiaires d''abord via le premier choix dans le menu de choix.');
            	writeln('   ----------------------------------------------------------------------------');
        end;
            End;
        If choix = 6 Then
            Begin
            		if CheckChargDonn = true then
            	begin
                AjouterStagiaire;
                AfficherEtatglobale;
                writeln('Un stagiaire a  ete ajoute avec succes.');
                end
            else
            begin
            	 	writeln(' * Veuillez remplir les donnees des stagiaires d''abord via le premier choix dans le menu de choix.');
            	writeln('   ----------------------------------------------------------------------------');
        end;
            End;
        If choix = 7 Then
            Begin
            	if CheckChargDonn = true then
            	begin
                RechercheStagiaire;
                end
            else
            begin
            	 	writeln(' * Veuillez remplir les donnees des stagiaires d''abord via le premier choix dans le menu de choix.');
            	writeln('   ----------------------------------------------------------------------------');
        end;
            End;
        If choix = 8 Then
            Begin
            	if CheckChargDonn = true then
            	begin
                ModifierStagiaire;
                AfficherEtatglobale;
                If modification = 1 Then
                    Begin
                        writeln('Modifie avec succes.');
                        modification := 0;
                    End;
                    end
            else
            begin
            	 	writeln(' * Veuillez remplir les donnees des stagiaires d''abord via le premier choix dans le menu de choix.');
            	writeln('   ----------------------------------------------------------------------------');
        end;
            End;
        If choix = 9 Then
            Begin
            	if CheckChargDonn = true then
            	begin
            	
                SuppUnStagiaire;
                AfficherEtatglobale;
                If modification = 1 Then
                    Begin
                        writeln('Effacement de stagiaire avec succes.');
                        modification := 0;
                    End;
                    end
            else
            begin
                    writeln(' * Veuillez remplir les donnees des stagiaires d''abord via le premier choix dans le menu de choix.');
            	writeln('   ----------------------------------------------------------------------------');
        end;
            End;
        If choix = 10 Then
            Begin
            	        if CheckChargDonn = true then
            	begin
                SuppToutes;
                writeln('Effacement des donnees avec succes.');
                 end
            else
            begin
            	 	writeln(' * Veuillez remplir les donnees des stagiaires d''abord via le premier choix dans le menu de choix.');
            	writeln('   ----------------------------------------------------------------------------');
        end;
            End;
        If choix = 11 Then
        if CheckChargDonn = true then
            	begin
            ChargementNote;
            end
            else
            begin
            	 	writeln(' * Veuillez remplir les donnees des stagiaires d''abord via le premier choix dans le menu de choix.');
            	writeln('   ----------------------------------------------------------------------------');
        end;
        If choix = 12 Then
        if CheckChargDonn = true then
            	begin
            AffiNoteGlobale;
            end
            else
            begin
            	 	writeln(' * Veuillez remplir les donnees des stagiaires d''abord via le premier choix dans le menu de choix.');
            	writeln('   ----------------------------------------------------------------------------');
        end;
        If choix = 13 Then
        if CheckChargDonn = true then
            	begin
            AffiNoteParticulier;
            end
            else
            begin
            	 	writeln(' * Veuillez remplir les donnees des stagiaires d''abord via le premier choix dans le menu de choix.');
            	writeln('   ----------------------------------------------------------------------------');
        end;
        If choix = 14 Then
        if CheckChargDonn = true then
            	begin
            AffiBNChaqueStagiaire;
            end
            else
            begin
            	 	writeln(' * Veuillez remplir les donnees des stagiaires d''abord via le premier choix dans le menu de choix.');
            	writeln('   ----------------------------------------------------------------------------');
        end;
        If choix = 15 Then
            Begin
                writeln('Vous avez quitter le programme.');
            End;
        If (choix < 1) Or (choix > 15) Then
            Begin
                writeln('--------------------------------------------');
                writeln('Incorrect choix entrer un nombre entre 1 et 15.');
            End;

    Until choix = 15;
End.
