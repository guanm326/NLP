%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CS4442 Asn 2 Answer Script
% Author: Guan Wei Liang
% Date: March 10, 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Question 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% B) (<4 min run time)
[ n1_u,n2_u,output ] = P1('DostoevskyPart1.txt','DostoevskyPart2.txt',7) 

%nGram = 1 yields 0.5471
%nGram = 2 yields 0.8185
%nGram = 3 yields 0.9500
%nGram = 4 yields 0.9898
%nGram = 5 yields 0.9979
%nGram = 6 yields 0.9995
%nGram = 7 yields 1


% C) Since 7 yields no similarity, nGram 6 will give at least 1 different
[ n1_u,n2_u,output ] = P1('DostoevskyPart1.txt','DostoevskyPart2.txt',6);
common = ismember(n2_u,n1_u); 
index = find(common==1); %index

n1_u(721) %'against it if i really have'
n1_u(1657) % 'and so every day when i'
n1_u(1841) % 'and what a good round belly'
n1_u(2276) % 'as the attilas and stenka razins'
n1_u(2531) % 'at this mouse in action let'
n1_u(3505) % 'calculated and tabulatedchaos and darkness and'
n1_u(3554) % 'can guess for yourself the officer'
n1_u(7430) % 'i am forty i used to'
n1_u(8797) % 'instance have a great deal of'
n1_u(9851) % 'kept within bounds it is profitable'
n1_u(17442) % 'these laws of nature and man'

% D) Dickens and Kafka Largest Commonalities (< 5 min run time)
%nGram 6 yields 0.9998
[ n1_u,n2_u,output ] = P1('Dickens.txt','KafkaTrial.txt',6);
common = ismember(n2_u,n1_u); 
index = find(common==1); %index

n1_u(4495) %'alongside and the hoarse pilot wrapped'
n1_u(6927) % 'and he be burnt in the'
n1_u(8622) % 'and station likely to be corrupted'
n1_u(22091) % 'country and so contrived that one'
n1_u(22918) % 'date my recovery from the receipt'
n1_u(27206) % 'every possible variety of twist doing'
n1_u(27495) % 'excitement the lecture it has at'
n1_u(27885) % 'eyes upon her unfortunate child who'
n1_u(34889) % 'have good reason to remember and'
n1_u(34905) % 'have held a hundred times is'
n1_u(34907) % 'have her share which if not'
n1_u(36124) % 'heart and gay her merry eyes'
n1_u(36456) % 'her fondly when at once the'
n1_u(50165) % 'low and flat the settlements and's
n1_u(66555) % 'procession under the windows of the'
n1_u(66926) % 'punished by the laws the public'
n1_u(69665) % 'said of kingston that one half'
n1_u(75052) % 'steps to another vast desert called'
n1_u(76658) % 'taken up piecemeal like a childs'

% E) MarxEngelsManifest and SmithWealthNations
[ n1_u,n2_u,output ] = P1('MarxEngelsManifest.txt','SmithWealthNations.txt',5);
common = ismember(n2_u,n1_u); 
index = find(common==1); %index

n1_u(745)% 'and of exchange and with'
n1_u(5102)%'lawyer the priest the poet'
n1_u(9993)%'therefrom they desire the existing'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Question 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%RUN Application
 [ output ] = P2('DostoevskyPart1.txt','DostoevskyPart2.txt',1);

% ngram=6 = 1
% ngram=5 = 1
% ngram=4 = 1
% ngram=3 = 1
% ngram=2 = 0.9075
% ngram=1 = 1


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Question 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[ output ] = P3( 'MarxEngelsManifest.txt',3,10 );

%Quesiton
 
%b

%n=1
% he while all it i the the court little job representing stepped the girls she said caused bed machine with

%n=2
% her moving house painter didnt mislead me too wide open and dont have to fall through in this inflated child

%n=3
% five petty lawyers said the painter nodded as if the priest i still get visits from some particular kind of

%n=4
%  a holiday above all he could manage to give the manufacturer who was already at the door to the workshop

%n=10
% can you belong to himself said the officials from the door whom he was brought here in the first place


%c


%d
%  the theoretical conclusions of the bourgeoisie has subjected the country dependent on the extension of factories and instruments of production 


%e) ngram= 3 text= MarxEngelsManifest.txt
% proletarians and in the modern proletariat never existed they forget


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Question 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



















