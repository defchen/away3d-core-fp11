package away3d.animators.states
{
	import away3d.animators.data.ParticleRenderParameter;
	import away3d.animators.nodes.ParticleFreeColorLocalNode;
	import away3d.animators.nodes.ParticleNodeBase;
	import away3d.animators.ParticleAnimator;
	import flash.display3D.Context3DVertexBufferFormat;

	/**
	 * ...
	 */
	public class ParticleFreeColorLocalState extends ParticleStateBase
	{
		private var colorNode:ParticleFreeColorLocalNode;
		
		public function ParticleFreeColorLocalState(animator:ParticleAnimator, particleNode:ParticleNodeBase)
		{
			super(animator, particleNode);
			colorNode = particleNode as ParticleFreeColorLocalNode;
		}
			
		override public function setRenderState(parameter:ParticleRenderParameter) : void
		{
			if (parameter.activatedCompiler.needFragmentAnimation)
			{
				var index:int;
				if (colorNode.hasMult)
				{
					index = parameter.activatedCompiler.getRegisterIndex(particleNode, ParticleFreeColorLocalNode.COLOR_MULTIPLE_STREAM_REGISTER);
					parameter.streamManager.activateVertexBuffer(index, parameter.streamManager.getNodeDataOffset(particleNode), parameter.stage3DProxy, Context3DVertexBufferFormat.FLOAT_4);
					if (colorNode.hasOffset)
					{
						index = parameter.activatedCompiler.getRegisterIndex(particleNode, ParticleFreeColorLocalNode.COLOR_OFFSET_STREAM_REGISTER);
						parameter.streamManager.activateVertexBuffer(index, parameter.streamManager.getNodeDataOffset(particleNode) + 4, parameter.stage3DProxy, Context3DVertexBufferFormat.FLOAT_4);
					}
				}
				else
				{
					index = parameter.activatedCompiler.getRegisterIndex(particleNode, ParticleFreeColorLocalNode.COLOR_OFFSET_STREAM_REGISTER);
					parameter.streamManager.activateVertexBuffer(index, parameter.streamManager.getNodeDataOffset(particleNode), parameter.stage3DProxy, Context3DVertexBufferFormat.FLOAT_4);
				}
			}
		}
		
	}

}