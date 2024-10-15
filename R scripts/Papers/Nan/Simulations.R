
library(StrathE2E2)

#### No fishing, compare climate ####

basemodel<-e2e_read(model.name="Ascension",
                    model.variant="2010-2019",
                    models.path="./StrathE2E/Models/",
                    results.path="./StrathE2E/Results/",
                    model.ident="baseline")
basemodel$data$fleet.model$gear_mult[1:8]<-0  # set all industrial gear in the 2010s model to zero

scenariomodel<-e2e_read(model.name="Ascension",
                        model.variant="2040-2049",
                        models.path="./StrathE2E/Models/",
                        results.path="./StrathE2E/Results/",
                        model.ident="scenario")
scenariomodel$data$fleet.model$gear_mult[1:8]<-0  # set all industrial gear in the 2010s model to zero

baseresults<-e2e_run(basemodel,nyear=50,csv.output=FALSE)

#e2e_plot_ts(basemodel,baseresults,"ECO")

scenarioresults<-e2e_run(scenariomodel,nyear=50,csv.output=FALSE)

#e2e_plot_ts(scenariomodel,scenarioresults,"ECO")

mdiff_results1 <- e2e_compare_runs_bar(selection="AAM",
                                       model1=NA, use.saved1=FALSE, results1=baseresults,
                                       model2=NA, use.saved2=FALSE, results2=scenarioresults,
                                       log.pc="PC", zone="W",
                                       bpmin=(-10),bpmax=(+80),
                                       maintitle="2010-2019 baseline vs 2040-2049 (no fishing)")

mdiff_results1LG <- e2e_compare_runs_bar(selection="AAM",
                                       model1=NA, use.saved1=FALSE, results1=baseresults,
                                       model2=NA, use.saved2=FALSE, results2=scenarioresults,
                                       log.pc="LG", zone="W",
                                       bpmin=(-0.3),bpmax=(+0.3),
                                       maintitle="2010-2019 baseline vs 2040-2049 (no fishing)")

mdiff_results2 <- e2e_compare_runs_bar(selection="CATCH",
                                       model1=NA, use.saved1=FALSE, results1=baseresults,
                                       model2=NA, use.saved2=FALSE, results2=scenarioresults,
                                       log.pc="PC", zone="W",
                                       bpmin=(-10),bpmax=(+120),
                                       maintitle="2010-2019 baseline vs 2040-2049 (no fishing)")

#### fishing, compare climate ####

basemodel<-e2e_read(model.name="Ascension",
                    model.variant="2010-2019",
                    models.path="./StrathE2E/Models/",
                    results.path="./StrathE2E/Results/",
                    model.ident="baseline")

scenariomodel<-e2e_read(model.name="Ascension",
                        model.variant="2040-2049",
                        models.path="./StrathE2E/Models/",
                        results.path="./StrathE2E/Results/",
                        model.ident="scenario")

baseresults<-e2e_run(basemodel,nyear=50,csv.output=FALSE)

#e2e_plot_ts(basemodel,baseresults,"ECO")

scenarioresults<-e2e_run(scenariomodel,nyear=50,csv.output=FALSE)

#e2e_plot_ts(scenariomodel,scenarioresults,"ECO")

mdiff_results3 <- e2e_compare_runs_bar(selection="AAM",
                                       model1=NA, use.saved1=FALSE, results1=baseresults,
                                       model2=NA, use.saved2=FALSE, results2=scenarioresults,
                                       log.pc="PC", zone="W",
                                       bpmin=(-10),bpmax=(+80),
                                       maintitle="2010-2019 baseline vs 2040-2049 (fishing)")

mdiff_results3LG <- e2e_compare_runs_bar(selection="AAM",
                                         model1=NA, use.saved1=FALSE, results1=baseresults,
                                         model2=NA, use.saved2=FALSE, results2=scenarioresults,
                                         log.pc="LG", zone="W",
                                         bpmin=(-0.3),bpmax=(+0.3),
                                         maintitle="2010-2019 baseline vs 2040-2049 (fishing)")

mdiff_results4 <- e2e_compare_runs_bar(selection="CATCH",
                                       model1=NA, use.saved1=FALSE, results1=baseresults,
                                       model2=NA, use.saved2=FALSE, results2=scenarioresults,
                                       log.pc="PC", zone="W",
                                       bpmin=(-10),bpmax=(+120),
                                       maintitle="2010-2019 baseline vs 2040-2049 (fishing)")


