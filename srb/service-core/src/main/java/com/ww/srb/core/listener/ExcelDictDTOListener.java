package com.ww.srb.core.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.ww.srb.core.mapper.DictMapper;
import com.ww.srb.core.pojo.dto.ExcelDictDTO;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@NoArgsConstructor //无参
public class ExcelDictDTOListener extends AnalysisEventListener<ExcelDictDTO> {

    // 没有被spring管理，通过构造函数注入
    private DictMapper dictMapper;

    // 每隔5条存储数据库，实际使用中可以3000条，然后清理list ，方便内存回收
    private static final int BATCH_COUNT = 5;

    // 数据列表
    List<ExcelDictDTO> list = new ArrayList();

	//传入mapper对象
    public ExcelDictDTOListener(DictMapper dictMapper) {
        this.dictMapper = dictMapper;
    }

    /**
     *遍历每一行的记录
     * @param data
     * @param context
     */
    @Override
    public void invoke(ExcelDictDTO data, AnalysisContext context) {
        log.info("解析到一条记录: {}", data);
        list.add(data);
        // 达到BATCH_COUNT了，需要去存储一次数据库，防止数据几万条数据在内存，容易OOM
        if (list.size() >= BATCH_COUNT) {
            saveData();
            // 存储完成清理 list
            list.clear();
        }
    }

    /**
     * 所有数据解析完成了 都会来调用
     */
    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {
        // 当最后剩余的数据记录不足BATCH_COUNT时，我们最终一次性存储剩余数据
        saveData();
        log.info("所有数据解析完成！");
    }

    /**
     * 加上存储数据库
     */
    private void saveData() {
        log.info("{}条数据，开始存储数据库！", list.size());
        dictMapper.insertBatch(list);  //批量插入
        log.info("存储数据库成功！");
    }
}