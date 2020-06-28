using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using ClassLibrary;


// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService" in both code and config file together.
[ServiceContract]
public interface IService
{
    [OperationContract]
    List<test_data> GetTestData();

    [OperationContract]
    List<test_data> GetTestDataFilter(string query);

    [OperationContract]
    List<config_parameters> GetConfigParameter();

    [OperationContract]
    List<config_parameters> GetConfigParameterFilter(string query);

    [OperationContract]
    List<config_parameters> GetConfigParametersFilterasTag(string query);

    [OperationContract]
    List<param_analysis> GetAnalysis();
    [OperationContract]
    List<param_analysis> GetAnalysisFilter(string query);


}
