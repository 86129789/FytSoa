using FytSoa.Common;
using FytSoa.Core.Model.Cms;
using FytSoa.Service.DtoModel;

namespace FytSoa.Service.Interfaces
{
    /*!
    * 文件名称：CmsDownload服务接口
    */
	public interface ICmsDownloadService: IBaseServer<CmsDownload>
	{
        /// <summary>
        /// 添加一条数据
        /// </summary>
        /// <param name="parm">CmsColumn</param>
        /// <returns></returns>
        Page<CmsDownload> GetList(PageParm parm);
    }
}