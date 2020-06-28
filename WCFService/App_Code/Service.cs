using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
public class Service : IService
{
    ServiceHelper svc = new ServiceHelper();

    public List<test_data> GetTestData()
    {
        return svc.GetTestData();
    }
    public List<test_data> GetTestDataFilter(string query)
    {
        return svc.GetTestDataFilter(query);
    }

    public List<config_parameters> GetConfigParameter()
    {
        return svc.GetConfigParameter();
    }
    public List<config_parameters> GetConfigParameterFilter(string query)
    {
        return svc.GetConfigParameterFilter(query);
    }

    public List<config_parameters> GetConfigParametersFilterasTag(string query)
    {
        return svc.GetConfigParametersFilterasTag(query);
    }

    public List<param_analysis> GetAnalysis()
    {
        return svc.GetAnalysis();
    }

    public List<param_analysis> GetAnalysisFilter(string query)
    {
        return svc.GetAnalysisFilter(query);
    }

}
