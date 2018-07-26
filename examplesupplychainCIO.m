%This m-file reproduces the simulation example of the CIO conference paper.

%%Call the model
model = 'exintercol.slx';
load_system(model);
% open(model)
%% Market (define the market demand parameters, mean and variance)
m=100;
varianza=20;

%% Retailer
%Forecasting system parameters
ini1=100;
alpha1=0.1;
alpha2=0.01;
ini2=15;
k=norminv(0.95,0,1);
lt=3;
%orderuptolevel parameter
S=1000;

%% Manufacturer
%Forecasting system parameters
ini1=50;
alpha1=0.1;
alpha2=0.01;
ini2=15;
k=norminv(0.95,0,1);
lt=3;
%orderuptolevel
S=2000;
Tp=3; %manufacturing time

%% Run the simulation

sim(model)

%% Plot the figures
%Mean forecast
figure
subplot(2,2,1)
plot(predmean(:,1),predmean(:,2),'--k',predmean(:,1),predmean(:,3),'-k')
hold on
plot(predmean(:,1),predmean(:,3),'-k','linewidth',2)
xlabel('Time')
legend('Demand','Mean Forecast')
axis([100 150 85 115])%Variance forecast
subplot(2,2,3)
plot(predquantile(:,1),predquantile(:,2),'--k',predquantile(:,1),predquantile(:,3),'-k')
hold on
plot(predquantile(:,1),predquantile(:,3),'-k','linewidth',2)
xlabel('Time')
legend('Squared error','Variance Forecast')
axis([100 150 0 150])

subplot(2,2,[2 4])
plot(stockretail(:,1),stockretail(:,2),'-k'), hold on
plot(stockretail(:,1),stockretail(:,3),'-k','linewidth',2)
plot(stockretail(:,1),stockretail(:,4),'--k','linewidth',2)

xlabel('Time')
legend('Reorder point','Inventory position','Net Stock','Location','Best')
axis([100 150 -50 950])
