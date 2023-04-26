clear variables
clc

%Userinput WIP integration ins ui noch to do
segmentcount = 3;                                                           %Zahl der Teilsegmente
GEOMETRY = [0; 0; 0];                                                       %alles rechtecke
Segmentlength = [100; 100; 25];
Segmentangle = [0; 90; 33];
Segmentthiccness = [10; 10; 10];
Segmentradius = [0;0;0];

% definieren der start und endpunkte Rechtecksegment
P(:,:,1) = [0 0; Segmentlength(1)*cos(Segmentangle(1)) Segmentlength(1)*sin(Segmentangle(1))];                                                      %P(1 = Anfangspunkt 2 = Endpunkt,1=x,2=y,Segment index) = [Anfangspunktx Anfangspunkty; Endpunktx Endpunkty]                                             
for i = 2: segmentcount
    P(:,:,i) = [P(2,1,i-1) P(2,2,i-1);P(2,1,i-1)+Segmentlength(i)*cos(Segmentangle(i))... %addieren der Längenanteile des Segmentes auf den anfangspunkt des Segmentes -> festlegen des endpunktes
                P(2,2,i-1)+Segmentlength(i)*sin(Segmentangle(i))];
end
% Schwerpunktberechnung für jedes einzelne Segment

for i = 1:segmentcount
    switch GEOMETRY(i)
        case 0                                                              
            disp('Rechteck');
            disp('Segment');
            disp(i);
            disp('Anfangspunkt')
            disp(P(1,:,i));%Anfangspunkt des Segments
            disp('Endpunkt')
            disp(P(2,:,i));%Endpunkt des Segments
            fsp(:,i)= 1/2*(P(1,:,i)+P(2,:,i));%Berechnung des FSP (liegt bei rechtechsegmenten genau in der Mitte)
            disp('FSP:')
            disp(fsp);
            % line(P(1,1,i),P(1,2,i));
        case 1 % Berechnung des Schwerpunkts für ein Kreissegment
                % THIS IS BULLSHIT WILL DO LATER
        % disp ('Kreis')
        % fsp= [a+segmentlength/2;radius*length/(alpha/(360*pi*radius/2))]
        % ^muss dann noch irgendwie in hauptkoordinatensystem transformiert
        % werden, da sich das auf die symmetrieachse bezieht!!!!!!!!
            disp('WORK IN PROGRESS');
        otherwise
        error('Ungültige Geometrie');
    end

end

% Gesamtschwerpunkt
sumA = 0;
sumAy = 0;
sumAx = 0;
for i =1:segmentcount
    A=Segmentlength(i)*Segmentthiccness(i);
    sumA = A+sumA;
    sumAy= sumAy+(A*fsp(2,i));
    sumAx= sumAx++(A*fsp(1,i));
end
FSPyges=sumAy/sumA
FSPxges=sumAx/sumA

% %Flächenträgheitsmoment
% for i = 1:segmentcount
%     Iy = 



% tramsformation FTM

Ix = 1/2*(Isx+Isy)+
Iy = 1/2*(Isx+Isy)
Ixy = 

