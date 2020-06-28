using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class ServiceHelper
    {
        //Test_Output
        public List<test_data> GetTestData()
        {
            try
            {
                using (ConfigEntities cfg = new ConfigEntities())
                {
                    return cfg.test_data.OrderBy(x => x.parameter).ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }
          
        }

        public List<test_data> GetTestDataFilter(string query)
        {
            try
            {
                using (ConfigEntities cfg = new ConfigEntities())
                {
                    List<test_data> t_data = cfg.test_data.Where(x => x.parameter.Contains(query)).OrderByDescending(x => x.parameter).ToList();
                    return t_data.ToList();
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
           
        }

        //Config_Parameter
        public List<config_parameters> GetConfigParameter()
        {
            try
            {
                using (ConfigEntities cfg = new ConfigEntities())
                {
                    return cfg.config_parameters.OrderBy(x => x.id).ToList();
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public List<config_parameters> GetConfigParameterFilter(string query)
        {
            try
            {
                using (ConfigEntities cfg = new ConfigEntities())
                {
                    List<config_parameters> t_data = cfg.config_parameters.Where(x => x.parameter.Contains(query)).OrderBy(x => x.id).ToList();
                    return t_data.ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public List<config_parameters> GetConfigParametersFilterasTag(string query)
        {
            try
            {
                using (ConfigEntities cfg = new ConfigEntities())
                {
                    List<config_parameters> t_data = cfg.config_parameters.Where(x => x.tag.Contains(query)).OrderBy(x => x.id).ToList();
                    return t_data.ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Analysis for Parameter
        public List<param_analysis> GetAnalysis()
        {
            try
            {
                using(ConfigEntities ent = new ConfigEntities())
                {
                    return ent.param_analysis.ToList();
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<param_analysis> GetAnalysisFilter(string query)
        {
            try
            {
                using(ConfigEntities ent = new ConfigEntities())
                {
                    return ent.param_analysis.Where(x => x.parameter.Contains(query)).ToList();
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
