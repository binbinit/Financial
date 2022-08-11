<template>
  <div class="personal-main">
    <div class="personal-money">
      <h3><i>还款计划</i></h3>

      <div class="personal-moneylist" style="margin-top: 40px;">
        <div class="pmain-contitle">
          <span class="pmain-title1 fb" style="width: 150px;">
            还款期数
          </span>
          <span class="pmain-title2 fb" style="width: 70px;">
            还款日期
          </span>
          <span class="pmain-title3 fb" style="width: 100px;">
            应还本金
          </span>
          <span class="pmain-title4 fb" style="width: 100px;">
            应还利息
          </span>
          <span class="pmain-title5 fb" style="width: 100px;">
            状态
          </span>
          <span class="pmain-title6 fb" style="width: 100px;">
            是否逾期
          </span>
          <span class="pmain-title7 fb" style="width: 100px;">备注</span>
        </div>
        <ul>
          <li
            v-for="transFlow in transFlowList"
            :key="transFlow.id"
            style="width:100%"
          >
            <span class="pmain-title1 pmain-height" style="width: 150px;">
            无 
            </span>
            <span class="pmain-title2 pmain-height" style="width: 70px;">
            无
            </span>
            <span class="pmain-title3 pmain-height" style="width: 100px;">
            无
            </span>
            <span class="pmain-title4 pmain-height" style="width: 100px;">
            无
            </span>
            <span class="pmain-title5 pmain-height" style="width: 100px;">
            无
            </span>
            <span class="pmain-title6 pmain-height" style="width: 100px;">
            无
            </span>
            <span class="pmain-title7 pmain-height" style="width: 100px;">
            无
            </span>
            <span
              :title="还款计划"
              class="pmain-title1 pmain-height"
              style="width: 500px; overflow: hidden;"
            >
            无
            </span>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
 data() {
    return {
      transFlowList: [],
    };
  },
};
</script>
