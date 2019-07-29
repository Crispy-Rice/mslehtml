<html>
<body>
<form class="layui-form" action="">

 <div class="layui-form-item">
  <!--<div class="layui-inline">
      <label class="layui-form-label">id</label>
      <div class="layui-input-inline">
        <input name="id" lay-verify="required" readonly="" autocomplete="off" class="layui-input" type="text">
      </div>
    </div>-->
    <div class="layui-inline">
      <label class="layui-form-label">起始城市</label>
      <div class="layui-input-inline">
        <input name="constantCityStart" lay-verify="required" autocomplete="off" class="layui-input" type="text">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">终点城市</label>
      <div class="layui-input-inline">
        <input name="constantCityEnd" lay-verify="required" autocomplete="off" class="layui-input" type="text">
      </div>
    </div>
   
    <div class="layui-inline">
      <label class="layui-form-label">城市间距离</label>
      <div class="layui-input-inline">
        <input name="constantDistance" lay-verify="required" autocomplete="off" class="layui-input" type="text">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">价格</label>
      <div class="layui-input-inline">
        <input name="constantPrice" lay-verify="required" autocomplete="off" class="layui-input" type="text">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">预估时间 经济</label>
      <div class="layui-input-inline">
        <input name="constantTimeSubstantial" lay-verify="required" autocomplete="off" class="layui-input" type="text">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">预估时间 标准</label>
      <div class="layui-input-inline">
        <input name="constantTimeStandard" lay-verify="required" autocomplete="off" class="layui-input" type="text">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">预估时间 特快</label>
      <div class="layui-input-inline">
        <input name="constantTimePosthaste" lay-verify="required" autocomplete="off" class="layui-input" type="text">
      </div>
    </div>
    <div class="layui-inline">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="edit">立即提交</button>
    </div>
  </div>
  </div>
</form>
<script>
layui.use(['form', 'layedit'] ,function(){
  var $ = layui.jquery
  ,form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit; 
  var index = parent.layer.getFrameIndex(window.name); //修改成功的时候点击 确定 会关闭子窗口，这里获取一下子窗口
  form.render();
  //监听提交
  form.on('submit(edit)', function(data){ //这块要跟表单中的lay-filter="editStudent"对应
    $.ajax({          
              url: "${pageContext.request.contextPath}/constant/updateConstant",       
              type: "post",                
              async: false,   //不要让它异步提交
              data: data.field,                  
              dataType: "json",       
              success: function (data) {      
                  if(data.msg!='0'){ 
                      layer.alert("修改成功",{icon: 1,time:2000},function () {
                            layer.close(layer.index); 
                            window.parent.location.reload();    //重新加载父页面，进行数据刷新
                        });   
                    } else{
                        layer.alert("修改失败",{icon: 2,time:2000});
                    }
                }   
            });  
    return false;
  });
   
});
</script>
</body>
</html>