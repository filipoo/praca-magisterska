clear all; close all; clc

q=linspace(0.0015, 0.003, 10); %vector of inductance
q=round(100000*q)/100000;
L1tab=q;

L1=q(1);
offset=1;
vol=0.2;                    %triangle 
f=100;                      %basic frequency
frad=f*6.283185299990382;   %[rad/s]
f2=2000;                    %triangle frequency
simtime=1/f*5;              %simulation time
%sinAmp=1;
%ramp=0;
ramp=150*simtime*10;         %ramp coef
z=140;                       %ilosc zwojow
ldrutu=z*2*(0.028+0.014);    %wire length
Rdrutu=ldrutu*0.0144;        %wire resistance

a=1;                         %default function coef y=ax+b
b=0;                         %default function coef y=ax+b