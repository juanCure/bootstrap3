{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}
	</main>

	{* Sidebars *}
	{if empty($isFullWidth)}
		{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
		
		<aside id="sidebar" class="pkp_structure_sidebar left col-xs-12 col-sm-2 col-md-4" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
			{* Agregando los botones Número actual, Números anteriores y Avance en línea*}
			<div class="pkp_block">
				<div id="numero_actual" class="botones_derecha">
					<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="current"}">
						{translate key="plugins.themes.bootstrap3.navigation.current"}
					</a>
				</div>
				<div id="numeros_anteriores" class="botones_derecha">
					<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}">
						{translate key="plugins.themes.bootstrap3.navigation.archives"}
					</a>
				</div>
				<div id="avance_linea" class="botones_derecha">
					{if $theMostRecentUnpublishedIssueId != 0}
						<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="view" path=$theMostRecentUnpublishedIssueId}">
							{translate key="plugins.themes.bootstrap3.navigation.advance.online"}
						</a>
					{else}
						<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="current"}">
							{translate key="plugins.themes.bootstrap3.navigation.advance.online"}
						</a>
					{/if}
				</div>
			</div>
			{if $sidebarCode}
				{$sidebarCode}
			{/if}
		</aside><!-- pkp_sidebar.left -->
	{/if}
	</div><!-- pkp_structure_content -->

	<footer class="footer" role="contentinfo">

		<div class="container">

			<div class="row">
				{if $pageFooter}
				<div class="col-md-10">
					{$pageFooter}
				</div>
				{/if}

				<div class="col-md-2" role="complementary">
					<a href="{$pkpLink}">
						<img class="img-responsive" alt="{translate key="common.publicKnowledgeProject"}" src="{$baseUrl}/{$brandImage}">
					</a>
				</div>

			</div> <!-- .row -->
		</div><!-- .container -->
	</footer>
</div><!-- pkp_structure_page -->

{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
