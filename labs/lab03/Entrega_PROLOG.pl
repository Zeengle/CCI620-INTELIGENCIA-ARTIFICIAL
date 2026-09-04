progenitor(josé, joão).
progenitor(maria, joão).
progenitor(josé, ana).
progenitor(maria, ana).
progenitor(ana, helena).
progenitor(ana, joana).
progenitor(joão, paulo).
progenitor(paulo, carlos).
progenitor(helena, carlos).

homem(josé).
homem(joão).
homem(paulo).
homem(carlos).

mulher(maria).
mulher(joão).
mulher(helena).
mulher(joana).

eh_pai(Pai,Filho) :- progenitor(Pai,Filho), homem(Pai).
eh_mae(Mae,Filho) :- progenitor(Mae,Filho), mulher(Mae).
    
eh_irmao(Irmao, Irma) :- homem(Irmao), progenitor(Pai, Irmao), progenitor(Pai, Irma), Irmao /= Irma.
eh_irma(Irma, Irmao) :- mulher(Irma), progenitor(Pai, Irmao), progenitor(Pai, Irma), Irma /= Irmao.
sao_irmao(X,Y) :- progenitor(P, X), progenitor(P, Y), X \= Y.

eh_primo(X,Y) :- progenitor(Pai, X), progenitor(Mae, Y), sao_irmao(Pai, Mae), X \= Y.

eh_tio(Tio, Sobrinho) :- progenitor(P, Sobrinho), sao_irmao(Tio, P).

eh_sobrinho(Sobrinho, Tio) :- eh_tio(Tio, Sobrinho).

ascendente(X, Y) :- progenitor(X, Y).
ascendente(X, Z) :- progenitor(X, Y), ascendente(Y,Z).